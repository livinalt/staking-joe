import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const StakingJoeModule = buildModule("StakingJoeModule", (m) => {
  const joeToken = "0xC0D3b853CE6eC974e6a752179Cb8C246E689c3B7";

  const stakingJoe = m.contract("StakingJoe", [joeToken]);

  return { stakingJoe };
});

export default StakingJoeModule;

