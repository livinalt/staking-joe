import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const JoeTokenModule = buildModule("JoeTokenModule", (m) => {

  const joeToken = m.contract("JoeToken", []);

  return { joeToken };
});

export default JoeTokenModule;

