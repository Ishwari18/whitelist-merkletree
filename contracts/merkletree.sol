// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract merkletree is ERC721, Ownable {
    using Counters for Counters.Counter;
    bytes32 public root;

    Counters.Counter private _tokenIdCounter;

    constructor(bytes32 _root) ERC721("MyToken", "MTK") {
        root = _root;
    }

    function safeMint(address to, bytes32[] memory proof, bytes32 leaf ) public {
        require(isValid(proof, leaf), "Not a part of Whitelist");
        //require(check(id, name, signature) == owner(), "Voucher Invalid");
        //require(redeemed[id] != true, "Already redeemed");
        _tokenIdCounter.increment();
        uint256 tokenId = _tokenIdCounter.current();
        _safeMint(to, tokenId);
        //redeemed[id] = true; 
    }

    function isValid(bytes32[] memory proof, bytes32 leaf) public view returns(bool) {
        return MerkleProof.verify(proof, root, leaf);

    }

}