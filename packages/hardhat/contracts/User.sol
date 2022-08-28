pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IUser.sol";

contract User is IUser, Ownable {
    event AllocationSet(uint8[] allocations, address[] recipients);

    uint8[] private allocations;
    address[] private recipients;

    constructor(
        address newOwner,
        uint8[] memory _allocations,
        address[] memory _recipients
    ) {
        setAllocations(_allocations, _recipients);
        transferOwnership(newOwner);
    }

    function getRecipients() public view override returns (address[] memory) {
        return recipients;
    }

    function getAllocations() public view override returns (uint8[] memory) {
        return allocations;
    }

    function setAllocations(
        uint8[] memory _allocations,
        address[] memory _recipients
    ) public override onlyOwner {
        require(
            0 <= _recipients.length && _recipients.length <= 256,
            "Recipients length is not appropriate"
        );
        require(
            0 <= _allocations.length && _allocations.length <= 256,
            "Allocation length is not appropriate"
        );
        require(
            _allocations.length == recipients.length,
            "Length of two sequences do not match!"
        );
        // uint allocationsAccumulated = 0;
        // for (uint i = 0; i < _recipients.length; i++) {
        //     allocationPerAddress[_recipients[i]] = _allocations[i];
        //     allocationsAccumulated += _allocations[i];
        // }
        // totalAllocations += allocationsAccumulated;
        emit AllocationSet(_allocations, _recipients);
    }

    function getRecipientsLength() public view override returns (uint) {
        return recipients.length;
    }

    // to support receiving ETH by default
    receive() external payable override {}

    fallback() external payable override {}
}
