// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract CircusTrickToken is ERC721, ERC721URIStorage {
    constructor() ERC721("Circus Trick Token", "CTT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmPvD9amB58pVw8Y1Js68GUQPmdv4XmV8D2nacnAaziFqQ";
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}