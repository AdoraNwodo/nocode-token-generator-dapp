//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomERC1155Token is ERC1155, Ownable {
    
    string public baseMetadataURI; // the token metadata URI
    string public name; // the token name
    bool public isMintable; // can i mint this token
    uint256 public mintFee = 0 wei; // mintfee, 0 by default
    string[] public names; // string array of names
    uint256[] public ids; // uint array of ids
    

    mapping(string => uint256) public nameToId; //name to id mapping
    mapping(uint256 => string) public idToName; //id to mapping

    /*
    constructor is executed when the factory contract calls its own create method
    */
    constructor(
        string memory _contractName,
        string memory _uri,
        bool __isMintable,
        string[] memory _names,
        uint256[] memory _ids
    ) ERC1155(_uri) {
        names = _names;
        ids = _ids;
        createMapping();
        setURI(_uri);
        baseMetadataURI = _uri;
        name = _contractName;
        isMintable = __isMintable;
        transferOwnership(msg.sender);
    }

    function getNames() public view returns (string[] memory) {
        return names;
    }

    /*
    creates a mapping of strings to ids vice-versa
    */
    function createMapping() private {
        for (uint256 id = 0; id < ids.length; id++) {
            nameToId[names[id]] = ids[id];
            idToName[ids[id]] = names[id];
        }
    }

    /*
    used to change metadata, only owner access
    */
    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    /*
    mint(address _account, uint _id, uint256 amount)

    _account - address to mint the token to
    _id - the ID being minted
    amount - amount of tokens to mint
    */
    function mint(
        address _account,
        uint256 _id,
        uint256 _amount
    ) public payable returns (uint256) {
        require(isMintable, "Cannot mint this token");
        require(msg.value == mintFee);
        _mint(_account, _id, _amount, "");
        return _id;
    }
}