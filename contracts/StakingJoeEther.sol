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

    event TokenStaked(address indexed staker, uint256 indexed amount);
    event TokenUnstaked(address indexed staker, uint256 indexed totalReturn);

    mapping(address => StakerAccount) public stakers;
    mapping(address => bool) public hasStaked; // Checks if a staker has staked

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not the owner");
        _;
    }

    function stakeJoe() external payable returns (address, uint256, bool) {
        require(!stakingClosed, "The staking period is closed");
        require(msg.value > 0, "You can't stake zero amount");

        stakers[msg.sender].stakingStartTime = block.timestamp;
        stakers[msg.sender].stakedAmount += msg.value;
        stakers[msg.sender].reward = 0; 
        hasStaked[msg.sender] = true;

        return (msg.sender, block.timestamp, true);

        emit TokenStaked(msg.sender, msg.value);
    }


    function unStakeJoe() external {
    
    }

    function calculateReward(uint256 duration) public pure returns (uint256){

    }

    function checkBalance() external view returns (uint256) {
        return stakers[msg.sender].stakedAmount;
    }

    function checkContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function toggleStaking() external onlyOwner returns (bool, uint256) {
        stakingClosed = !stakingClosed;
        return (stakingClosed, block.timestamp);
    }

    // This implements a fallback to receive Ether
    receive() external payable {}

}