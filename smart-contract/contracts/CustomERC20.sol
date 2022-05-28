// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CustomERC20 is ERC20, Ownable {
    // Token properties
    string private _name;
    string private _symbol;
    bool private _isBurnable;
    bool private _isMintable;
    uint256 private _totalSupply;

    constructor(
        string memory name_,
        string memory symbol_,
        bool isBurnable_,
        bool isMintable_,
        uint256 initialSupply_
    ) ERC20(name_, symbol_) {
        _name = name_;
        _symbol = symbol_;
        _isBurnable = isBurnable_;
        _isMintable = isMintable_;
        _totalSupply = initialSupply_;

        address origin = tx.origin;
        ERC20._mint(origin, initialSupply_ * 10**18);
        transferOwnership(origin);
    }

    function mint(address account, uint256 amount) public onlyOwner {
        require(_isMintable, "token is not mintable");
        ERC20._mint(account, amount);
    }

    function burn(address account, uint256 amount) public {
        require(_isBurnable, "token cannot be burned");
        ERC20._burn(account, amount);
    }
}
