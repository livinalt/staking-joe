# StakingJoe Contracts

This repository contains three smart contracts for staking Joe Tokens and Ether. The contracts allow users to stake either the custom ERC20 token "Staker Joe" or Ether, earn rewards based on their staked amounts, and withdraw their stakes and rewards after the staking period.

## Contracts Overview

### 1. **JoeToken (ERC20 Token)**

- **Address:** `0xC0D3b853CE6eC974e6a752179Cb8C246E689c3B7`  
  [View on Blockscout](https://sepolia-blockscout.lisk.com/address/0xC0D3b853CE6eC974e6a752179Cb8C246E689c3B7#code)
  
  This contract implements the "Staker Joe" ERC20 token (`STJ`) which is used in the staking process.
  
  - **Symbol:** STJ
  - **Owner:** The contract deployer.
  - **Minting:** The owner can mint new tokens.

### 2. **StakingJoe (Token Staking Contract)**

- **Address:** `0xCdd928A2Af1E9f3846d0Ec505874a25815071030`  
  [View on Blockscout](https://sepolia-blockscout.lisk.com/address/0xCdd928A2Af1E9f3846d0Ec505874a25815071030#code)
  
  This contract allows users to stake `STJ` tokens and earn rewards over time. Stakers can:
  - **Stake tokens** by transferring STJ to the contract.
  - **Unstake** tokens and claim rewards after a minimum staking duration of 1 day.

  #### Key Functions:
  - `stakeJoe(uint256 amount)`: Stake a specific amount of STJ tokens.
  - `unStakeJoe()`: Unstake and withdraw your staked tokens plus earned rewards.
  - `toggleStaking()`: Owner can enable or disable staking.
  
  #### Events:
  - `TokenStaked`: Emitted when tokens are successfully staked.
  - `TokenUnstaked`: Emitted when tokens and rewards are withdrawn.

### 3. **StakingJoeEther (Ether Staking Contract)**

- **Address:** `0x5F785708eaedB2D636E6163fa443a8b47ef3b3A2`  
  [View on Blockscout](https://sepolia-blockscout.lisk.com/address/0x5F785708eaedB2D636E6163fa443a8b47ef3b3A2#code)

  This contract allows users to stake Ether and earn rewards based on the duration of staking. Stakers can:
  - **Stake Ether** by sending it to the contract.
  - **Unstake** and claim their Ether along with rewards after a minimum staking period of 1 day.

  #### Key Functions:
  - `stakeJoe()`: Stake Ether by sending a transaction with some value.
  - `unStakeJoe()`: Unstake Ether and withdraw both the staked amount and rewards.
  - `toggleStaking()`: Owner can enable or disable Ether staking.

  #### Events:
  - `TokenStaked`: Emitted when Ether is successfully staked.
  - `TokenUnstaked`: Emitted when Ether and rewards are withdrawn.

## Contract Addresses

- **JoeToken:** `0xC0D3b853CE6eC974e6a752179Cb8C246E689c3B7`
  - [View on Blockscout](https://sepolia-blockscout.lisk.com/address/0xCdd928A2Af1E9f3846d0Ec505874a25815071030#code)
  
- **StakingJoe:** `0xCdd928A2Af1E9f3846d0Ec505874a25815071030`
  - [View on Blockscout](https://sepolia-blockscout.lisk.com/address/0xCdd928A2Af1E9f3846d0Ec505874a25815071030#code)
  
- **StakingJoeEther:** `0x5F785708eaedB2D636E6163fa443a8b47ef3b3A2`
  - [View on Blockscout](https://sepolia-blockscout.lisk.com/address/0x5F785708eaedB2D636E6163fa443a8b47ef3b3A2#code)

## Usage Instructions

1. **Staking Joe Tokens**:
   - Ensure you have `STJ` tokens in your wallet.
   - Call the `stakeJoe()` function on the `StakingJoe` contract to start staking.

2. **Staking Ether**:
   - Send Ether to the `StakingJoeEther` contract by calling `stakeJoe()` with a value greater than 0.

3. **Unstaking**:
   - After the minimum staking duration (1 day), call the `unStakeJoe()` function on either contract to withdraw your staked amount and any earned rewards.

4. **Admin Functions**:
   - Contract owners can toggle staking on or off using the `toggleStaking()` function.

## License

This project is licensed under the MIT License.