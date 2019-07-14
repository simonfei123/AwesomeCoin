const AwesomeCoin = artifacts.require("./AwesomeCoin");
const AwesomeCoinSale = artifacts.require("./AwesomeCoinSale");

module.exports = function(deployer) {
  deployer.deploy(AwesomeCoin, 1000000).then(function(){
  	//token price is 0.001 ETH
  	var tokenPrice = 1000000000000000; // in wei
  	return deployer.deploy(AwesomeCoinSale, AwesomeCoin.address, tokenPrice);
  });
  
};
