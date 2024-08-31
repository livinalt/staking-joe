// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./IERC20.sol";

/* 
This is a contract that allows you to stake

 */

contract StakingJoe{

   address public owner;
    address public tokenAddress; // The token to be staked
    bool public stakingClosed; 

    struct StakerAccount {
        uint256 stakingStartTime; // The time when the user initiated staking
        uint256 stakedAmount;     // Amount of tokens staked by the staker
        uint256 reward;           // Reward earned by the staker
    }

    mapping(address => StakerAccount) public stakers;
    mapping(address => bool) public hasStaked; // Checks if a staker has staked

    constructor(address _tokenAddress) {
        owner = msg.sender;
        tokenAddress = _tokenAddress;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not the owner");
        _;
    }

    function stakeJoe(uint256 amount) external returns (address, uint256, bool) {
        require(!stakingClosed, "The staking period is closed");
        require(amount > 0, "You can't stake zero amount");

        uint256 userBalance = IERC20(tokenAddress).balanceOf(msg.sender);
        require(amount <= userBalance, "Insufficient tokens");

        IERC20(tokenAddress).transferFrom(msg.sender, address(this), amount);

        stakers[msg.sender].stakingStartTime = block.timestamp;
        stakers[msg.sender].stakedAmount += amount;
        stakers[msg.sender].reward = 0; 
        hasStaked[msg.sender] = true;

        return (msg.sender, block.timestamp, true);
    }

    function unStakeJoe() external {
        require(hasStaked[msg.sender], "You don't have an active stake");

        StakerAccount memory staker = stakers[msg.sender]; // creating the staker instance
        require(block.timestamp >= staker.stakingStartTime + 1 days, "The staking period has not ended");

        uint256 stakedAmount = staker.stakedAmount;
        uint256 reward = calculateReward(block.timestamp - staker.stakingStartTime);

        staker.stakedAmount = 0;
        staker.reward = 0;
        hasStaked[msg.sender] = false;

        // staked tokens + reward is transfered back to the user
        IERC20(tokenAddress).transfer(msg.sender, stakedAmount + reward);
    }

    function calculateReward(uint256 duration) public pure returns (uint256) {
        uint256 yield = (10 * 1e18) / 100;
        uint256 reward = yield * (duration / 1 days); 
        return reward;
    }

    function checkBalance() external view returns (uint256) {
        return stakers[msg.sender].stakedAmount;
    }

    function checkContractBalance() external view returns (uint256) {
        return IERC20(tokenAddress).balanceOf(address(this));
    }

    function toggleStaking() external onlyOwner returns (bool, uint256) {
        stakingClosed = !stakingClosed;
        return (stakingClosed, block.timestamp);
    }


}

