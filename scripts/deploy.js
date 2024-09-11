const hre = require("hardhat");

async function main() {
  const SVG_NFT = await hre.ethers.getContractFactory("SVG_NFT");
  const svg_nft = await SVG_NFT.deploy();

  await svg_nft.waitForDeployment();

  console.log("SVG_NFT deployed to:", await svg_nft.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });