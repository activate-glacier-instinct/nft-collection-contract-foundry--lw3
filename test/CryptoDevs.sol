// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/src/Test.sol";
import "../src/CryptoDevs.sol";


contract CryptoDevsTest is Test {
    CryptoDevs public testContract;
    address private whitelistContractAddr;
    string private metaDataURL;

    function setUp() public {
        whitelistContractAddr = makeAddr('0xab747b92377f3eF8B2A6646af066Ab0947E19c18');
        metaDataURL = 'testurl';
        testContract = new CryptoDevs(metaDataURL, whitelistContractAddr);
    }

    function testContractInit() public {
        assertEq(testContract.maxTokenIds(), 20);
    }

    function testMintPresaleNotStartedFail() public {
        assertEq(testContract.presaleStarted(), false);

        vm.expectRevert("Presale has not ended yet");
        testContract.mint();
    }

    function testStartPresale() public {
        assertEq(testContract.presaleStarted(), false);
        testContract.startPresale();
        assertEq(testContract.presaleStarted(), true);
    }
}
