// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MergeSortedArray {
 
 function mergeSorted(uint[] memory a, uint[] memory b) public pure returns (uint[] memory) {
        uint na = a.length;
        uint nb = b.length;
        uint n = na + nb;

        uint[] memory out = new uint[](n);

        uint i = 0; // 指向 a
        uint j = 0; // 指向 b
        uint k = 0; // 指向 out

        while (i < na && j < nb) {
            if (a[i] <= b[j]) {
                out[k] = a[i];
                unchecked { i++; k++; }
            } else {
                out[k] = b[j];
                unchecked { j++; k++; }
            }
        }

        // 如果 a 有剩余
        while (i < na) {
            out[k] = a[i];
            unchecked { i++; k++; }
        }

        // 如果 b 有剩余
        while (j < nb) {
            out[k] = b[j];
            unchecked { j++; k++; }
        }

        return out;
    }

}