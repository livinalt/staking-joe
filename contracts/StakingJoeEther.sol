// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StakingJoeEther {
    address public owner;
    bool public stakingClosed;

    struct StakerAccount {
        uint256 stakingStartTime; // The time when the user initiated staking
        uint256 stakedAmount;     // Amount of Ether staked by the staker
        uint256 reward;           // Reward in ether earned by the staker
    }

    constructor() {
        
    }

    function stakeJoeEther() external payable {


    }

    function unStakeJoe() external {
    
    }

    function calculateReward(uint256 duration) public pure returns (uint256){

    }

    function checkBalance() external view returns (uint256){

    }

    function checkContractBalance() external view returns (uint256) {

    }

    function toggleStaking() external onlyOwner returns (bool, uint256){

    }

    // This implements a fallback to receive Ether
    receive() external payable {}

}