// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./customERC1155Token.sol";

contract ERC1155Factory {
    CustomERC1155Token[] public tokens; // an array that contains different ERC1155 tokens deployed
    mapping(uint256 => address) public indexToContract; //index to contract address mapping
    mapping(uint256 => address) public indexToOwner; //index to ERC1155 owner address

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
        uint256[] memory _ids,
        string[] memory _names
    ) external returns (address) {
        CustomERC1155Token t = new CustomERC1155Token(
            _contractName,
            _ids,
            _names,
            _uri
        );
        tokens.push(t); //id of new tokens added
        uint256 id = tokens.length - 1;
        indexToContract[id] = address(t);
        indexToOwner[id] = tx.origin;
        emit Created(msg.sender, address(t));
        return address(t);
    }

    /*
    mintERC1155 - mints a ERC1155 token with given parameters

    _index - index position in our tokens array - represents which ERC1155 you want to interact with
    _name - Case-sensitive. Name of the token (this maps to the ID you created when deploying the token)
    _amount - amount of tokens you wish to mint
    */
    function mintERC1155(
        uint256 _index,
        string memory _name,
        uint256 amount
    ) public {
        uint256 id = getIdByName(_index, _name);
        tokens[_index].mint(indexToOwner[_index], id, amount);
        emit Minted(tokens[_index].owner(), address(tokens[_index]), amount);
    }

    /*
    Helper functions below retrieve contract data given an ID or name and index in the tokens array.
    */
    function getCountERC1155byIndex(uint256 _index, uint256 _id)
        public
        view
        returns (uint256 amount)
    {
        return tokens[_index].balanceOf(indexToOwner[_index], _id);
    }

    function getCountERC1155byName(uint256 _index, string calldata _name)
        public
        view
        returns (uint256 amount)
    {
        uint256 id = getIdByName(_index, _name);
        return tokens[_index].balanceOf(indexToOwner[_index], id);
    }

    function getIdByName(uint256 _index, string memory _name)
        public
        view
        returns (uint256)
    {
        return tokens[_index].nameToId(_name);
    }

    function getNameById(uint256 _index, uint256 _id)
        public
        view
        returns (string memory)
    {
        return tokens[_index].idToName(_id);
    }

    function getERC1155byIndexAndId(uint256 _index, uint256 _id)
        public
        view
        returns (
            address _contract,
            address _owner,
            string memory _uri,
            uint256 supply
        )
    {
        CustomERC1155Token token = tokens[_index];
        return (
            address(token),
            token.owner(),
            token.uri(_id),
            token.balanceOf(indexToOwner[_index], _id)
        );
    }
}
