// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {MoodNFT} from "../src/MoodNFT.sol";

contract MoodNFTTest is Test {
    MoodNFT moodNFT;
    string public constant HAPPY_SVG_URI =
        "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiID8+CjxzdmcgYmFzZVByb2ZpbGU9InRpbnkiIGhlaWdodD0iMjAwIiB2ZXJzaW9uPSIxLjIiIHdpZHRoPSIyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6ZXY9Imh0dHA6Ly93d3cudzMub3JnLzIwMDEveG1sLWV2ZW50cyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiPjxkZWZzIC8+PGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiBmaWxsPSJ5ZWxsb3ciIHI9IjkwIiBzdHJva2U9InJnYigwJSwwJSwwJSkiIHN0cm9rZS13aWR0aD0iNSIgLz48Y2lyY2xlIGN4PSI3MCIgY3k9IjgwIiBmaWxsPSJibGFjayIgcj0iMTAiIC8+PGNpcmNsZSBjeD0iMTMwIiBjeT0iODAiIGZpbGw9ImJsYWNrIiByPSIxMCIgLz48cGF0aCBkPSJNIDYwIDEyMCBRIDEwMCAxODAgMTQwIDEyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSJyZ2IoMCUsMCUsMCUpIiBzdHJva2Utd2lkdGg9IjUiIC8+PC9zdmc+";
    string public constant SAD_SVG_URI =
        "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiID8+CjxzdmcgYmFzZVByb2ZpbGU9InRpbnkiIGhlaWdodD0iMjAwIiB2ZXJzaW9uPSIxLjIiIHdpZHRoPSIyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6ZXY9Imh0dHA6Ly93d3cudzMub3JnLzIwMDEveG1sLWV2ZW50cyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiPjxkZWZzIC8+PGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiBmaWxsPSJ5ZWxsb3ciIHI9IjkwIiBzdHJva2U9InJnYigwJSwwJSwwJSkiIHN0cm9rZS13aWR0aD0iNSIgLz48Y2lyY2xlIGN4PSI3MCIgY3k9IjgwIiBmaWxsPSJibGFjayIgcj0iMTAiIC8+PGNpcmNsZSBjeD0iMTMwIiBjeT0iODAiIGZpbGw9ImJsYWNrIiByPSIxMCIgLz48cGF0aCBkPSJNIDYwIDE2MCBRIDEwMCAxMjAgMTQwIDE2MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSJyZ2IoMCUsMCUsMCUpIiBzdHJva2Utd2lkdGg9IjUiIC8+PC9zdmc+";

    address USER = makeAddr("user");

    function setUp() public {
        moodNFT = new MoodNFT(HAPPY_SVG_URI, SAD_SVG_URI);
    }

    function testViewTokenUri() public {
        vm.prank(USER);
        moodNFT.mintNFT();

    }
}
