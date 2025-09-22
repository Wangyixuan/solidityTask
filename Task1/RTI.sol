// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract RTI {
    // 单字符对应数值
    function valueOf(bytes1 ch) internal pure returns (uint) {
        if (ch == "I") return 1;
        if (ch == "V") return 5;
        if (ch == "X") return 10;
        if (ch == "L") return 50;
        if (ch == "C") return 100;
        if (ch == "D") return 500;
        if (ch == "M") return 1000;
        revert("Invalid Roman numeral");
    }

    // 罗马数字转整数
    function fromRoman(string memory roman) public pure returns (uint) {
        bytes memory s = bytes(roman);
        uint total = 0;

        for (uint i = 0; i < s.length; i++) {
            uint curr = valueOf(s[i]);
            uint next = 0;
            if (i + 1 < s.length) {
                next = valueOf(s[i + 1]);
            }

            if (curr < next) {
                total -= curr; // 小数在大数前，要减
            } else {
                total += curr; // 否则加
            }
        }
        return total;
    }
}