// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract C1 {
    uint totalSeconds;
    bool public isMember = false;

    constructor() {
        totalSeconds = 3600;
    }
}