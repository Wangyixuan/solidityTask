// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ITR {

 // 罗马数字的符号和对应值
   string[13] private romanSymbols = [
        "M",  "CM", "D", "CD", "C", "XC", "L",
        "XL", "X",  "IX", "V", "IV", "I"
    ];
    uint16[13] private romanValues = [
        1000, 900, 500, 400, 100,
        90,   50,  40,  10,   9,
        5,    4,   1
    ];

    // 整数转罗马数字
    function toRoman(uint256 num) public view returns (string memory) {
        require(num > 0, "Must be positive");
        bytes memory result;

        for (uint i = 0; i < romanValues.length; i++) {
            while (num >= romanValues[i]) {
                num -= romanValues[i];
                result = abi.encodePacked(result, romanSymbols[i]);
            }
        }

        return string(result);
    }

}