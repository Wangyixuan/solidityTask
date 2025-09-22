// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BinarySearch {
    /// @notice 在有序数组 arr 中查找 target
    /// @return index 找到返回索引，否则返回 type(uint).max 表示未找到
    function search(uint[] memory arr, uint target) public pure returns (uint) {
        uint low = 0;
        uint high = arr.length;

        while (low < high) {
            uint mid = low + (high - low) / 2; // 防止溢出

            if (arr[mid] == target) {
                return mid; // 找到
            } else if (arr[mid] < target) {
                low = mid + 1;
            } else {
                high = mid;
            }
        }

        return type(uint).max; // 未找到
    }
}