#🚩 Challenge 1: 🥩 Decentralized Staking App

🦸 A superpower of Ethereum is allowing you, the builder, to create a simple set of rules that an adversarial group of players can use to work together. In this challenge, you create a decentralized application where users can coordinate a group funding effort. If the users cooperate, the money is collected in a second smart contract. If they defect, the worst that can happen is everyone gets their money back. The users only have to trust the code.

🏦 Build a Staker.sol contract that collects ETH from numerous addresses using a payable stake() function and keeps track of balances. After some deadline if it has at least some threshold of ETH, it sends it to an ExampleExternalContract and triggers the complete() action sending the full balance. If not enough ETH is collected, allow users to withdraw().

🎛 Building the frontend to display the information and UI is just as important as writing the contract. The goal is to deploy the contract and the app to allow anyone to stake using your app. Use a Stake(address,uint256) event to list all stakes.

🌟 The final deliverable is deploying a Dapp that lets users send ether to a contract and stake if the conditions are met, then yarn vercel your app to a public webserver. 

Example Contract @ sepolia: 0x9dF46ECb74e64F802bd6875FB502B7304fE8d769

Staker Contract @ sepolia: 0x6Ec940897689fDA29ed7C27Fe090A880BE4690EB

Preview @: https://nextjs-astronaut828-jimmy-john.vercel.app

