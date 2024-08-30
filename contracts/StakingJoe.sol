// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./IERC20.sol";

/* 
This is a contract that allows you to stake

 */

contract StakingJoe{

    bool stakingClosed;
    bool hasStaked;
    uint256 stakingDuration; // this is the storage duration 
    address owner;
    address tokenAddress; // this is the token we are depositing    
    

    mapping(address => uint256) balances; // this hods all the balance of the stakes
    mapping(address => bool) stakingActive; // this hods all the balance of the stakes
    mapping(address => bool) contractStakingClosed; // this hods all the balance of the stakes


    constructor(){
        owner = msg.sender;
    }

    function stakedJoe(uint256 amount) external {
        require( !hasStaked, "You have already staked");
        require(amount > 0, "you cannot send zero");

        uint256 _userBalance = IERC20(tokenAddress).balanceOf(msg.sender);

        require(amount > _userBalance, "insufficient tokens");

        IERC20(tokenAddress).transfer(address(this), amount);        
        balances[msg.sender] += amount;
        hasStaked = true;
    }

    function unStakeJoe() external {
        require( hasStaked, "You don't have an active stake");
        require(block.timestamp>stakingDuration, "The staking duration is not over yet");

        uint256 yield = (10 * 1e18) / 100;
        uint256 reward = yield * stakingDuration;
        
           uint256 _stakedReward = balances[msg.sender]* reward;
           uint256 _stakedBalance = balances[msg.sender] + _stakedReward;

           IERC20(tokenAddress).transfer(msg.sender, _stakedBalance);
           balances[msg.sender] -= _stakedBalance;

           hasStaked;
    }

    function calculateReward() external view returns(uint256){
        uint256 yield = (10 * 1e18) / 100;
        uint256 reward = yield * stakingDuration;
        return reward;
    }

    function checkStakingStatus() external view returns(bool){
        return stakingActive[msg.sender];
    }

    function checkBalanace() external view returns(uint256){
        return balances[msg.sender];
    }

    function checkContractBalance() external view returns(uint256){
        return balances[address(this)];
    }
    
    // function isStakingOpen(bool isOpen) external view returns(uint256){
    //     if(isOpen){
            

    //     }
    // }
    
    // function toggleStaking() external view returns(bool _isOpen){
    //     contractStakingClosed = _isOpen;
    // }



}

