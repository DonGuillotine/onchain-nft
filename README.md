# On-Chain SVG NFT Project

This project demonstrates how to create, deploy and mint NFTs with on-chain SVG images using Solidity smart contracts and the Hardhat development environment.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
  - [Compile Contracts](#compile-contracts)
  - [Run Tests](#run-tests)
  - [Deploy Contract](#deploy-contract)
  - [Mint NFT](#mint-nft)
- [Contract Details](#contract-details)
- [Scripts](#scripts)
- [Viewing Your NFT](#viewing-your-nft)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project implements an ERC721 token (NFT) with an on-chain SVG image. The SVG data is stored directly in the smart contract, ensuring that the image data is immutable and always available on the blockchain.

Key features:
- ERC721 compliant NFT contract
- On-chain SVG storage
- Minting functionality
- Deployment scripts for easy testing and mainnet deployment

## Prerequisites

Before you begin, ensure you have met the following requirements:
- Node.js (v14.0.0 or later)
- npm (usually comes with Node.js)
- An Ethereum wallet with some Sepolia ETH for deployment and minting (you can get test ETH from a Sepolia faucet)
- An Alchemy account for accessing the Sepolia testnet

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/DonGuillotine/onchain-nft.git
   cd onchain-nft
   ```

2. Install the dependencies:
   ```
   npm install
   ```

## Configuration

1. Create a `.env` file in the root directory with the following content:
   ```
   ALCHEMY_API_KEY=your_alchemy_api_key_here
   PRIVATE_KEY=your_wallet_private_key_here
   ETHERSCAN_API_KEY=your_etherscan_api_key_here
   ```

2. Replace the placeholders with your actual API keys and private key.

## Usage

### Compile Contracts

Compile the smart contracts using Hardhat:

```
npx hardhat compile
```

### Run Tests

Run the test suite to ensure everything is working correctly:

```
npx hardhat test
```

### Deploy Contract

Deploy the contract to the Sepolia testnet:

```
npx hardhat run scripts/deploy.js --network sepolia
```

Make note of the deployed contract address output by this script.

### Mint NFT

After deployment, you can mint an NFT using the provided script:

1. Update the `contractAddress` in `scripts/mint.js` with your deployed contract address.
2. Run the minting script:
   ```
   npx hardhat run scripts/mint.js --network sepolia
   ```

## Contract Details

The main contract `SVG_NFT.sol` implements the following functionality:
- ERC721 token standard
- On-chain SVG storage
- Custom `tokenURI` function that returns the NFT metadata with the embedded SVG image
- Minting function to create new NFTs

## Scripts

- `deploy.js`: Deploys the SVG_NFT contract to the specified network.
- `mint.js`: Mints a new NFT on the deployed contract.

## Viewing Your NFT

After minting, you can view your NFT on OpenSea's testnet marketplace:

1. Go to [https://testnets.opensea.io/](https://testnets.opensea.io/)
2. Connect your wallet (the same one used for deployment and minting)
3. Search for your NFT using the contract address
4. You should see your newly minted NFT with the on-chain SVG image

## Contributing

Contributions to this project are welcome. Please fork the repository and create a pull request with your proposed changes.

## License

[MIT License](LICENSE)
