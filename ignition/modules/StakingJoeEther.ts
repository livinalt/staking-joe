import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const StakingJoeEtherModule = buildModule("StakingJoeEtherModule", (m) => {

  const stakingJoeEther = m.contract("StakingJoeEther", []);

  return { stakingJoeEther };
});

export default StakingJoeEtherModule;

