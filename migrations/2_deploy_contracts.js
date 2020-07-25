var SimpleStorage = artifacts.require("./FileManager.sol");

module.exports = function(deployer) {
  deployer.deploy(FileManager);
};
