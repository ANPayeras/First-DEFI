// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./DEFIToken.sol";
import "./RewardDEFIToken.sol";

contract FarmContract {

    // Declarations
    string public name = "DEFI Farm";
    address public owner;
    DefiToken public defiToken;
    RewardDEFIToken public rewardDefiToken;

    address[] public stakers;
    mapping(address => uint) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;

    constructor(DefiToken _defiToken, RewardDEFIToken _rewardDefiToken) {
        defiToken = _defiToken;
        rewardDefiToken = _rewardDefiToken;
        owner = msg.sender;
    }

    // Stake Tokens
    function stakeTokens(uint _amount) public {
        require(_amount > 0, "The amount must be greather than 0");
        // Transfer tokens
        defiToken.transferFrom(msg.sender, address(this), _amount);
        // Increase the balance of the staker
        stakingBalance[msg.sender] += _amount;
        // Save the staker
        if(!hasStaked[msg.sender]) {
            stakers.push(msg.sender);
        }
    }

}