// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./CustomERC1155.sol";
import "./TokenData.sol";

contract ERC1155Factory {
    mapping(address => ERC115Token[]) private addressToTokens; // a mapping that contains different ERC1155 tokens deployed

    event Created(address owner, address tokenContract); //emitted when ERC1155 token is deployed
    event Minted(address owner, address tokenContract, uint256 amount); // emmitted when ERC1155 token is minted

    /*
        create - deploys a ERC1155 token with given parameters - returns deployed address

        _contractName - name of our ERC1155 token
        _uri - URI resolving to our hosted metadata
        _ids - IDs the ERC1155 token should contain
        _names - Names each ID should map to. Case-sensitive.
    */
    function create(
        string memory _contractName,
        string memory _uri,
        bool _isMintable,
        uint256[] memory _ids,
        string[] memory _names
    ) external returns (bool) {
        CustomERC1155Token t = new CustomERC1155Token(
            _contractName,
            _uri,
            _isMintable,
            _names,
            _ids
        );
        // Save token data
        address sender = msg.sender;
        address tokenAddress = address(t);
        ERC115Token[] storage tokens = addressToTokens[sender];
        tokens.push(ERC115Token(_contractName, _uri, _names, tokenAddress, _ids));
        addressToTokens[sender] = tokens;

        emit Created(sender, tokenAddress);
        return true;
    }

    function getAll() public view returns(ERC115Token[] memory)
    {
        address sender = msg.sender;
        ERC115Token[] memory tokens = addressToTokens[sender];
        return tokens;
    }
}