// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/src/Test.sol";
import "../src/CryptoDevs.sol";
import "./MockWhitelist.sol";


contract CryptoDevsTest is Test {
    CryptoDevs public _cryptoDevs;
    MockWhitelist private _mockWhitelist;
    address private whitelistContractAddr;
    string private metaDataURL;

    function setUp() public {
        metaDataURL = 'testurl';
        _mockWhitelist = new MockWhitelist();
        _cryptoDevs = new CryptoDevs(metaDataURL, address(_mockWhitelist));
    }

    function testContractInit() public {
        assertEq(_cryptoDevs.maxTokenIds(), 20);
    }

    function testMintPresaleNotStartedFail() public {
        assertEq(_cryptoDevs.presaleStarted(), false);

        vm.expectRevert("Presale has not ended yet");
        _cryptoDevs.mint();
    }

    function testStartPresale() public {
        assertEq(_cryptoDevs.presaleStarted(), false);
        _cryptoDevs.startPresale();
        assertEq(_cryptoDevs.presaleStarted(), true);
    }

    function testPresaleEnded() public {
        testStartPresale();
        uint256 fiveMinutesFromNow = block.timestamp + 5 minutes;
        assertEq(_cryptoDevs.presaleEnded(), fiveMinutesFromNow);
    }

    function testMintPresaleNotEndedFail() public {
        testStartPresale();
        vm.expectRevert("Presale has not ended yet");
        _cryptoDevs.mint();
    }

    function testMintPresaleEndedSuccess() public {
        testMintPresaleNotEndedFail();
        uint256 sixMinutesFromNow = block.timestamp + 6 minutes;
        vm.warp(sixMinutesFromNow); // Increase blocktime by 10min
        vm.expectRevert("Ether sent is not correct");
        _cryptoDevs.mint();
    }

    function testSetPaused() public {
        assertEq(_cryptoDevs._paused(), false);
        _cryptoDevs.setPaused(true);
        assertEq(_cryptoDevs._paused(), true);
    }

    function testMintWhenPausedFail() public {
        testSetPaused();
        vm.expectRevert("Contract currently paused");
        _cryptoDevs.mint();
    }

    function testPresaleMintPresaleNotStartedFail() public {
        vm.expectRevert("Presale is not running");
        _cryptoDevs.presaleMint();
    }

    function testPresaleMintPresaleNotWhitelistedFail() public {
        _cryptoDevs.startPresale();
        vm.expectRevert("You are not whitelisted");
        vm.prank(address(1));
        _cryptoDevs.presaleMint();
    }
}
