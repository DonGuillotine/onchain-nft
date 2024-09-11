// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract SVG_NFT is ERC721 {
    uint256 private _nextTokenId;

    string private constant SVG_IMAGE = '<svg width=\"800px\" height=\"800px\" viewBox=\"0 0 16 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M8 16L3.54223 12.3383C1.93278 11.0162 1 9.04287 1 6.96005C1 3.11612 4.15607 0 8 0C11.8439 0 15 3.11612 15 6.96005C15 9.04287 14.0672 11.0162 12.4578 12.3383L8 16ZM3 6H5C6.10457 6 7 6.89543 7 8V9L3 7.5V6ZM11 6C9.89543 6 9 6.89543 9 8V9L13 7.5V6H11Z\" fill=\"#000000\"/></svg>';

    constructor() ERC721("SVG NFT", "SVGNFT") {
        _nextTokenId = 1;
    }

    function mintNFT() public returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        return tokenId;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert("ERC721Metadata: URI query for nonexistent token");
        }

        string memory base64EncodedSVG = Base64.encode(bytes(SVG_IMAGE));

        return string(
            abi.encodePacked(
                'data:application/json;base64,',
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"SVG NFT #', Strings.toString(tokenId), '",',
                            '"description":"An NFT with on-chain SVG image",',
                            '"image":"data:image/svg+xml;base64,', base64EncodedSVG, '",',
                            '"attributes":[]}'
                        )
                    )
                )
            )
        );
    }
}