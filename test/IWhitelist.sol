// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/src/Test.sol";
import "../src/IWhitelist.sol";

// TODO : add mocks

contract CryptoDevsTest is Test {
    IWhitelist public testContract;

    function setUp() public {
        // testContract = IWhitelist();
    }

    function testWhitelistedAddressesSuccess () public {
        assertEq(testContract.whitelistedAddresses(address(1)), true);
    }
    function testWhitelistedAddressesFail () public {
        assertEq(testContract.whitelistedAddresses(address(1)), false);
    }

}
