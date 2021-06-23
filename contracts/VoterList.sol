//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.0;
import "./UserContract.sol";

contract VoterList {
    struct CitizenSmartContract {
        address tokenAddress;
    }
    address[] public registeredVoters;
    address[] public citzenContractAddress;
    mapping(address => CitizenSmartContract) public CitizenAddress;

    function registerNewCitizen(
        string memory name,
        uint256 age,
        string memory gender
    ) public payable returns (address newContract) {
        UserContract generatedContract =
            (new UserContract(name, age, gender, msg.sender));
        registeredVoters.push(msg.sender);

        citzenContractAddress.push(generatedContract);
        return generatedContract;
    }

    function getContractAddress(address userAddress) public returns (address) {}
}
