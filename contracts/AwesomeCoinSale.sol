pragma solidity >=0.4.21;
import "./AwesomeCoin.sol";

contract AwesomeCoinSale {
	address payable admin;
	AwesomeCoin public tokenContract;
	uint256 public tokenPrice;
	uint256 public tokensSold;
	event Sell(address _buyer, uint256 _amount);
	address _thisAddress = address(this);

	constructor(AwesomeCoin _tokenContract, uint256 _tokenPrice) public {
		admin = msg.sender;
		tokenContract = _tokenContract;
		tokenPrice = _tokenPrice;
	}

	function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
    	
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        require(tokenContract.balanceOf(_thisAddress) >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        tokensSold += _numberOfTokens;

        emit Sell(msg.sender, _numberOfTokens);
    }

    function endSale() public {
        require(msg.sender == admin);
        require(tokenContract.transfer(admin, tokenContract.balanceOf(_thisAddress)));

        // UPDATE: Let's not destroy the contract here
        // Just transfer the balance to the admin
        //admin.transfer(_thisAddress.balance);
        //tokenContract.transfer(admin, _thisAddress.balance);
        selfdestruct(admin);
    }
}