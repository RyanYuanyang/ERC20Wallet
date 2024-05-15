# A wallet application for accessing ERC20 tokens.
<img width="1512" alt="Screenshot 2024-05-05 at 00 33 22" src="https://github.com/RyanYuanyang/ERC20Wallet/assets/78694466/8070300d-4ab7-466a-b60f-28215ef9bf8d">

## Token Info
2 tokens have been created and deployed to the Sepolia testchain, they are:

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

## Faucet Info
2 faucets have been deployed to the Sepolia testchain with respect to the TokenFite and Token2010 tokens they are:

        Faucet for TokenFite (0x9C566B38f25c9BE0b9203Ff52865776289195cD4)
        1. initial supply (from owner of TokenFite)
        2. withdrawal amount per request - 10
        3. locktime per request - 1 minutes

        Faucet for Token2010 (0x5A7Cf94819C9D5f2ec105052557Cf8490fD28962)
        1. initial supply (from owner of Token2010)
        2. withdrawal amount per request - 10
        3. locktime per request - 1 minutes

The two faucet are created from a single contract in contracts/Faucet.sol

## Project Structure
This is a hardhat ptoject. The front-end is a react application.

artifacts: stores all compiled objects

contracts: all contracts' source code (Faucet.sol and ERCCappedBurnableToken.sol)

scripts: Deployment scripts

test: Testign scripts

src: front-end react app

src/abis: contains the ABI for deployed contracts on the Sepolia testchain

src/components: React UI components


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
