// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

struct Token {
    string name;
    string symbol;
    string tokenType;
}

interface IStore {
    function saveToken(string memory _name, string memory _symbol, string memory _tokenType) external returns (bool);
    function returnTokens() external returns (Token[] memory);
}

contract Store is IStore{
    mapping(address => Token[]) private _tokens;

    event Created(string _name, string _symbol, string _tokenType);
    event Returned(address owner);

    function saveToken(string memory _name, string memory _symbol, string memory _tokenType) external returns (bool) {
        address sender = msg.sender;
        Token[] storage tokens = _tokens[sender];
        tokens.push(Token(_name, _symbol, _tokenType));
        _tokens[sender] = tokens;

        emit Created(_name, _symbol, _tokenType);

        return true;
    }

    function returnTokens() public returns(Token[] memory)
    {
        address sender = msg.sender;
        Token[] memory tokens = _tokens[sender];
        emit Returned(sender);

        return tokens;
    }

}