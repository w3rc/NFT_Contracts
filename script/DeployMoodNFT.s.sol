// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.21;

import {Script} from "forge-std/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNFT is Script {
    function run() external returns (MoodNFT) {
        string memory happySvg = vm.readFile("assets/happy_emoji.svg");
        string memory sadSvg = vm.readFile("assets/sad_emoji.svg");
        vm.startBroadcast();
        MoodNFT basicNFT = new MoodNFT(
            svgToImageUri(happySvg),
            svgToImageUri(sadSvg)
        );
        vm.stopBroadcast();

        return basicNFT;
    }

    function svgToImageUri(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseURL, svgBase64encoded));
    }
}
