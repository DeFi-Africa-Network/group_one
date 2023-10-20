// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Main {
    string name;

    function setUserName(string memory userName) public {
        name = userName;
    }

    function printMessage() public  view returns(string memory) {
        bytes memory concat_strings;
        concat_strings = abi.encodePacked("Hello ");
        concat_strings = abi.encodePacked(concat_strings, name);
        concat_strings = abi.encodePacked(concat_strings, "!");
        string memory message = string(concat_strings);

        return message;

    }
}