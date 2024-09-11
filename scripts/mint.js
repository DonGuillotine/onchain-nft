const hre = require("hardhat");

async function main() {
  const contractAddress = "0x9D79F571e0e56972f003Eb035DEE6Dba81Fe1408";
  const SVG_NFT = await hre.ethers.getContractFactory("SVG_NFT");
  const svg_nft = SVG_NFT.attach(contractAddress);

  console.log("Minting NFT...");
  const tx = await svg_nft.mintNFT();
  const receipt = await tx.wait();
  
  const event = receipt.logs.find(x => x.fragment.name === "Transfer");
  const tokenId = event.args[2];

  console.log(`NFT minted with token ID: ${tokenId}`);

  const tokenURI = await svg_nft.tokenURI(tokenId);
  console.log(`Token URI: ${tokenURI}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });