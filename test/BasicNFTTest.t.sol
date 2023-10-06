// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract CounterTest is Test {
    DeployBasicNFT deployer = new DeployBasicNFT();
    BasicNFT public basicNFT;
    address public user = makeAddr("USER");
    string public constant nft =
        "ipfs://QmVDtqezxc5KAF3YqUXDv7wKS9JnZzqfPpfXPDLEWd8FCb";

    function setUp() public {
        basicNFT = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "NFT Inu";
        string memory actualName = basicNFT.name();

        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(user);

        basicNFT.mintNFT(nft);

        assert(basicNFT.balanceOf(user) == 1);
        assert(
            keccak256(abi.encodePacked(nft)) ==
                keccak256(abi.encodePacked(basicNFT.tokenURI(0)))
        );
    }
}
