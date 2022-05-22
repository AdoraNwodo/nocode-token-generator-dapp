// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CustomToken {
    struct Token {
        string name;
        string symbol;
        string tokenType;
        uint256 initialSupply;
        uint256 decimals;
        bool isBurnable;
        bool isMintable;
        bool doesHolderRedistribution;
        bool hasFeesOrTaxes;
        uint8 holdersRewardFee;
        uint8 burnFeePercentage;
        uint8 transactionTaxPercentage;
        address taxReceivingAddress;
    }

    event Created(string _name, string _symbol, string _tokenType);
    event Returned(address owner);

    mapping(address => Token[]) createdTokens;

    modifier validString(string memory _string) {
        require(!isNullOrWhitespace(_string), "String is null or whitespace");
        _;
    }

    function isNullOrWhitespace(string memory _content)
        private
        pure
        returns (bool)
    {
        require(bytes(_content).length > 0, "String is null or empty");

        if (bytes(_content).length < 3) {
            return true;
        }

        bytes memory contentBytes = bytes(_content);

        for (uint8 _index = 2; _index < contentBytes.length; _index++) {
            if (_index % 2 == 0 && contentBytes[_index] != "2") {
                return false;
            }

            if (_index % 2 == 1 && contentBytes[_index] != "0") {
                return false;
            }
        }

        return true;
    }

    function equals(string memory str1, string memory str2)
        private
        pure
        returns (bool)
    {
        return
            keccak256(abi.encodePacked(str1)) ==
            keccak256(abi.encodePacked(str2));
    }

    function create(Token memory _token)
        public
        validString(_token.name)
        validString(_token.symbol)
        validString(_token.tokenType)
    {
        require(_token.initialSupply > 0, "Initial should be more than 0");
        require(_token.decimals > 0, "Decimals should be more than 0");
        require(
            equals(_token.tokenType, "ERC20") ||
                equals(_token.tokenType, "ERC721") ||
                equals(_token.tokenType, "ERC1155"),
            "Invalid token type"
        );

        if (_token.doesHolderRedistribution) {
            require(_token.holdersRewardFee <= 10, "Large holders reward fee");
        }

        if (_token.hasFeesOrTaxes) {
            require(_token.burnFeePercentage <= 10, "Large burn fee");
            require(
                _token.transactionTaxPercentage <= 10,
                "Large transaction tax"
            );
            require(
                _token.taxReceivingAddress != address(0),
                "Invalid tax receiving address"
            );
        }

        if (equals(_token.tokenType, "ERC20")) {
            // Call contract to create ERC20 Token
        } else if (equals(_token.tokenType, "ERC721")) {
            // Call contract to create ERC721 Token
        } else {
            // Call contract to create ERC1155 Token
        }

        Token[] storage tokens = createdTokens[msg.sender];
        tokens.push(_token);
        createdTokens[msg.sender] = tokens;

        emit Created(_token.name, _token.symbol, _token.tokenType);
    }

    function returnTokens() public returns (Token[] memory) {
        Token[] memory tokens = createdTokens[msg.sender];

        emit Returned(msg.sender);

        return tokens;
    }
}
