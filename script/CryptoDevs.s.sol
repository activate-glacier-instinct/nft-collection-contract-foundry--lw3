// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/src/Script.sol";
import { CryptoDevs } from '../src/CryptoDevs.sol';

contract CryptoDevsScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        string memory metadataUrl = vm.envString("METADATA_URL");
        address whitelistAddress = vm.envAddress("WHITELIST_CONTRACT_ADDRESS");

        vm.startBroadcast(deployerPrivateKey);

        
        new CryptoDevs(metadataUrl, whitelistAddress);

        vm.stopBroadcast();
    }
}
