//SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract CustomERC1155Token is ERC1155 {
    /**
     *@dev Implementation of basic token
     * `_id`,`_price` are array at same length
     *
     *We make matching between each asset and its price
     *
     * `_linkCollection` is the link of collection
     */
    constructor(
        uint256[] memory _id,
        uint256[] memory _price,
        string memory _linkCollection
    ) ERC1155(_linkCollection) {
        for (uint256 i = 0; i < _id.length; i++) {
            _mint(msg.sender, _id[i], _price[i], "");
        }
    }
}
