// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/src/Script.sol";
import { CryptoDevs } from '../src/CryptoDevs.sol';

contract CryptoDevsScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // CryptoDevs cryptoDevs = new CryptoDevs(2); // Max whitelist is 2 addresses

        vm.stopBroadcast();
    }
}
