A wallet application for accessing ERC20 tokens.

2 tokens have been created, they are:

        Name - TokenFite (0x53f245b834973FECFA6948eA197EBFD287893d6f)
        1. initial supply (send to owner) - 200,000
        2. max supply (capped) - 2,000,000
        3. burnable - Yes
        4. miner block reward - 20

        Name - Token2010 (0x8726EC83Aad2eAd44624FA0Be7721080A2642E23)
        1. initial supply (send to owner) - 100,000
        2. max supply (capped) - 1,000,000
        3. burnable - Yes
        4. miner block reward - 10

The two tokens are created from a single contract in contracts/ERC20CappedBurnableToken.sol

To test the contract, please use hardhat:
1. Run ```%npm install``` to install the dependencies
2. Compile the contracts: ```%npm hardhat compile```
3. Run testing: ```%npm hardhat test```

The web front-end allows user to transfer tokens to other addresses.
Run ```%npm start``` to start the font-end react application
