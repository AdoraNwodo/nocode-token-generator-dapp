// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract CustomERC721 is ERC721, Ownable {

    // Token properties
    string private _name;
    string private _symbol;
    bool private _isBurnable;
    bool private _isMintable;

    constructor(string memory name_, string memory symbol_, bool isBurnable_, bool isMintable_) ERC721(name_, symbol_) {
        _name = name_;
        _symbol = symbol_;
        _isBurnable = isBurnable_;
        _isMintable = isMintable_;

        address origin = tx.origin;
        transferOwnership(origin);
        ERC721._mint(origin, 1);
    }

    function mint(address to, uint256 tokenId) public onlyOwner {
        require(_isMintable, "not a mintable token");
        ERC721._mint(to, tokenId);
    }

    function burn(uint256 tokenId) public {
        require(_isBurnable, "not a burnable token");
        ERC721._burn(tokenId);
    }
}