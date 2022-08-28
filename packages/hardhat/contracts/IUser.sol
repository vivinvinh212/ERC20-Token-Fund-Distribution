pragma solidity >=0.8.0 <0.9.0;

//SPDX-License-Identifier: MIT

interface IUser {
    function getRecipients() external view returns (address[] memory);

    function getAllocations() external view returns (uint8[] memory);

    function setAllocations(
        uint8[] memory _allocations,
        address[] memory _recipients
    ) external;

    function getRecipientsLength() external view returns (uint);

    // to support receiving ETH by default
    receive() external payable;

    fallback() external payable;
}
