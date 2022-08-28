//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IUser.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";

contract Distributor {
    uint[] allocations;
}
