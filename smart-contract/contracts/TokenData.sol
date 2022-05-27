// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

struct Token {
    string name;
    string symbol;
    string tokenType;
    bool isBurnable;
    bool isMintable;
    address tokenAddress;
}

struct ERC115Token {
    string contractName;
    string uri;
    string[] names;
    address tokenAddress;
    uint256[] ids;
}
