//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.0;

contract UserContract {
    string public name;
    uint256 public age;
    string public gender;
    address public account;

    constructor(
        string memory userName,
        uint256 userAge,
        string memory userGender,
        address senderAddress
    ) public payable {
        name = userName;
        age = userAge;
        gender = userGender;
        account = senderAddress;
    }
}
