pragma solidity ^0.5.0;

contract BitWise {
    // count the number of bit set in data.  i.e. data = 7, result = 3

    function countBitSet(uint8 data) public pure returns (uint8 result) {
        for (uint256 i = 0; i < 8; i++) {
            if (((data >> i) & 1) == 1) {
                result += 1;
            }
        }
    }

    // write the above function using assembly

    function countBitSetAsm(uint8 data) public pure returns (uint8 result) {
        assembly {
            for {
                let i := 0
            } lt(i, 8) {
                i := add(i, 1)
            } {
                let x := and(shr(i, data), 1)
                if eq(x, 1) {
                    result := add(result, 1)
                }
            }
        }

        // result = countBitSet(data);

    }

}
