// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/src/Script.sol";
import { CryptoDevsV2 } from '../src/CryptoDevsV2.sol';

contract CryptoDevsV2Script is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        string memory metadataUrl = vm.envString("METADATA_URL");
        address whitelistAddress = vm.envAddress("WHITELIST_CONTRACT_ADDRESS");

        vm.startBroadcast(deployerPrivateKey);

        
        new CryptoDevsV2(metadataUrl, whitelistAddress);

        vm.stopBroadcast();
    }
}
