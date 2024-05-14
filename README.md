# A wallet application for accessing ERC20 tokens.
![Screenshot 2024-05-14 at 23 25 43](https://github.com/RyanYuanyang/ERC20Wallet/assets/78694466/e672c98c-1616-480d-ad83-39dd93991f10)

## Token Info
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

## Compile and Testing
**NOTE!!!
Please use node v22.1.0!
**

To test the contract, please use hardhat:
1. Run ```npm install``` to install the dependencies
2. Compile the contracts: ```npx hardhat compile```
3. Run testing: ```npx hardhat test```

## Deployment
If you want to create a new token based on the smart contract, you need to create a .env file with format:
 ```
API_URL=https://eth-sepolia.g.alchemy.com/v2/your-api-key
PRIVATE_KEY="your-metamask-private-key"
PUBLIC_KEY ="your-public-account-address" 
```
and enable   
```
  //  defaultNetwork: "sepolia",
  //  networks: {
  //     hardhat: {},
  //     sepolia: {
  //        url: API_URL,
  //        accounts: [`0x${PRIVATE_KEY}`]
  //     }
  //  },
```
in hardhat.config.js

Run ```npx hardhat --network sepolia run scripts/deploy.js``` to deploy the token to the sepolia testnet.

## Web application
The web front-end allows user to transfer tokens to other addresses.

Run ```npm start``` to start the font-end react application

If the transaction succeed, simply refresh the web page to get the latest account information.
![Screenshot 2024-05-14 at 23 28 06](https://github.com/RyanYuanyang/ERC20Wallet/assets/78694466/56a1e3d1-995d-45f4-9ff9-212daf678be1)

If the transaction failed, please try again since the network might be busy.
![Screenshot 2024-05-14 at 23 27 31](https://github.com/RyanYuanyang/ERC20Wallet/assets/78694466/4f1f793b-0b9e-4a5a-bb42-ecc85c79532c)

