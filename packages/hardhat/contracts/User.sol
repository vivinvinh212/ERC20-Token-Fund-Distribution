pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IUser.sol";

contract User is IUser, Ownable {
    event AllocationSet(address[] recipients, uint8[] allocations);

    string public purpose = "Building Unstoppable Apps!!!";

    constructor() payable {}

    function getRecipients() public view returns (address[] memory) {}

    function getAllocations() public view returns (uint8[] memory) {}

    function setAllocations() public onlyOwner {}

    function getRecipientsLength() public view returns (uint) {}

    // to support receiving ETH by default
    receive() external payable {}

    fallback() external payable {}
}
