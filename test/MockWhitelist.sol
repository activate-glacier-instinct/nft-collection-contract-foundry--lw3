// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../src/IWhitelist.sol";

// TODO : add mocks

contract MockWhitelist is IWhitelist {
    mapping(address => bool) private _whitelist;

    function addToWhitelist(address account) public {
        _whitelist[account] = true;
    }

    function removeFromWhitelist(address account) public {
        _whitelist[account] = false;
    }

    function whitelistedAddresses(address account) public view override returns (bool) {
        return _whitelist[account];
    }
}