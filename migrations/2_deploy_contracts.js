const AwesomeCoin = artifacts.require("AwesomeCoin");

module.exports = function(deployer) {
  deployer.deploy(AwesomeCoin);
};