// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {EtherGame} from "../src/Ethergame.sol";
import {Attack} from "../src/Attack.sol";

contract CounterTest is Test {
    EtherGame public ethergame;
    Attack public attacker;

    //3 Players
    address Player1 = makeAddr("1");
    address Player2 = makeAddr("2");
    address Player3 = makeAddr("3");
    address hacker = makeAddr("4");

    uint256 fundingAmount = 1 ether;

    function setUp() public {
        ethergame = new EtherGame();
        attacker = new Attack(address(ethergame));
        vm.deal(Player1, 10 ether);
        vm.deal(Player2, 10 ether);
        vm.deal(Player3, 10 ether);
        vm.deal(hacker, 10 ether);
    }

    function test__ethergameAttackIsPossible() public {
        //player 1 makes deposit in ethergame
        vm.prank(Player1);
        ethergame.deposit{value: fundingAmount}();
        assertEq(address(ethergame).balance, fundingAmount);

        //player 2 makes deposit in ethergame
        vm.prank(Player2);
        ethergame.deposit{value: fundingAmount}();
        assertEq(address(ethergame).balance, (fundingAmount * 2));

        // hacker calls the attack function which forces an amount greater than 7(Ethergame::targetAmount)
        attacker.attack{value: 6 ether}();
        assertEq(address(ethergame).balance, 8 ether);

        //Player3 deposits fails
        vm.startPrank(Player3);
        vm.expectRevert();
        ethergame.deposit{value: fundingAmount}();
        vm.stopPrank();
    }
}
