// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./TokenData.sol";
import "./CustomERC721.sol";

contract ERC721Factory {
    mapping(address => Token[]) private addressToTokens;
    CustomERC721[] public tokenList;

    event Created(string _name, string _symbol, string _tokenType);

    function create(string memory name_, string memory symbol_, bool isBurnable_, bool isMintable_) external returns (bool) {
        // Spin up new ERC721 token
        CustomERC721 erc721 = new CustomERC721(name_, symbol_, isBurnable_, isMintable_);
        tokenList.push(erc721);

        // Save token data
        address sender = msg.sender;
        Token[] storage tokens = addressToTokens[sender];
        tokens.push(Token(name_, symbol_, "ERC721", isBurnable_, isMintable_));
        addressToTokens[sender] = tokens;

        // Emit and retuen
        emit Created(name_, symbol_, "ERC721");
        return true;
    }

    function getAll() public view returns(Token[] memory)
    {
        address sender = msg.sender;
        Token[] memory tokens = addressToTokens[sender];
        return tokens;
    }
}