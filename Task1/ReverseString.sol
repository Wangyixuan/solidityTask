// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract reverseString {
   
    function reverse(string memory s) public pure returns (string memory) {
        bytes memory strBytes = bytes(s);
        uint len = strBytes.length;

        for (uint i = 0; i < len / 2; i++) {
            bytes1 temp = strBytes[i];
            strBytes[i] = strBytes[len - 1 - i];
            strBytes[len - 1 - i] = temp;
        }

        return string(strBytes);
    }
    
}