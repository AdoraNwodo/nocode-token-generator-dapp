// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomERC20Token is ERC20, Ownable {
    struct Token {
        string name;
        string symbol;
        string tokenType;
        uint256 initialSupply;
        uint8 decimals;
        bool isBurnable;
        bool isMintable;
        bool doesHolderRedistribution;
        bool hasFeesOrTaxes;
        uint8 holdersRewardFee;
        uint8 burnFeePercentage;
        uint8 transactionTaxPercentage;
        address taxReceivingAddress;
    }

    Token private token;

    constructor(Token memory _token) ERC20(_token.name, _token.symbol) {
        token = _token;
        //initialSupply
        if (_token.isMintable) {
            ERC20._mint(_msgSender(), _token.initialSupply);
        }
    }

    /**
     *@dev Returns the number of decimals used to get its user representation
     */
    function decimals() public view virtual override returns (uint8) {
        return token.decimals;
    }

    /**
     *@dev Destroys `amount` tokens from `account`, reducing the
     * total supply
     */
    function burn(address _account, uint256 _amount) public onlyOwner {
        require(!token.isBurnable, "Token impossible to burn");
        require(_amount > 0, "No tokens");
        // burn `burnFeePercent` of amount
        if (token.hasFeesOrTaxes) {
            uint256 applyBurnFeePercentage = (_amount *
                token.burnFeePercentage) / 100;
            ERC20._burn(_account, applyBurnFeePercentage);
        } else {
            ERC20._burn(_account, _amount);
        }
    }

    function transfer(
        address _from,
        address _to,
        uint256 _amount
    ) public {
        if (token.hasFeesOrTaxes) {
            uint256 fees = (_amount * token.transactionTaxPercentage) / 100;
            uint256 amount = _amount - fees;
            //Transfer fees to Address must receive fees
            ERC20._transfer(_from, token.taxReceivingAddress, fees);
            ERC20._transfer(_from, _to, amount);
        } else {
            ERC20._transfer(_from, _to, _amount);
        }
    }

    function holderReward(address holder) public onlyOwner {
        require(token.doesHolderRedistribution, "No rewards for holder");
        transfer(holder, token.holdersRewardFee);
    }
}
