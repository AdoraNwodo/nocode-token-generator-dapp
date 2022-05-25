// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

struct Token {
    string name;
    string symbol;
    string tokenType;
    bool isBurnable;
    bool isMintable;
}