pragma solidity 0.8.15;

contract OptimizedArraySum {
    // Do not modify this
    uint256[] array;
    error NotOver();

    // Do not modify this
    function setArray(uint256[] memory _array) external {
        require(_array.length <= 10, 'too long');
        array = _array;
    }

    // optimize this function
        function getArraySum(uint256[] calldata _array) public pure returns (uint256) {
        uint256 sum;
        uint256 _length = _array.length;
        for (uint256 i; i < _length; ) {
            sum += _array[i];
            unchecked {
                i++;
                sum;
            }
        }
        return sum;
    }
}
