pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IUser.sol";

contract User is IUser, Ownable {
    event AllocationSet(address[] recipients, uint8[] allocations);

    string public purpose = "Building Unstoppable Apps!!!";
    uint8[] allocations;
    address[] recipients;

    constructor() payable {}

    function getRecipients() public view returns (address[] memory) {
        return recipients;
    }

    function getAllocations() public view returns (uint8[] memory) {
        return allocations;
    }

    function setAllocations(
        uint8[] memory _ratios,
        address[] memory _recipients
    ) public onlyOwner {
        require(
            0 <= _recipients.length && _recipients.length <= 256,
            "Recipients length is not appropriate"
        );
        require(
            0 <= _ratios.length && _ratios.length <= 256,
            "Ratios length is not appropriate"
        );
        require(
            _ratios.length == recipients.length,
            "Length of two sequences do not match!"
        );
    }

    function getRecipientsLength() public view returns (uint) {
        return recipients.length;
    }

    // to support receiving ETH by default
    receive() external payable {}

    fallback() external payable {}
}
