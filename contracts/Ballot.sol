//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";

contract Ballot is Ownable {
    struct Candidates {
        uint256 id;
        string name;
        uint256 voteCount;
        bool doesExist;
    }

    struct Voter {
        bytes32 uid; // bytes32 type are basically strings
        uint256 candidateIDVote;
        bool hasVoted;
        address userAddress;
    }

    string[] public unMemeber;

    uint256 public candidatesCount;

    uint256 public totalVotes;

    string public date;

    mapping(uint256 => Candidates) public candidates;

    mapping(address => Voter) public voters;

    function vote(uint256 _candidateId) public {
        require(
            !candidates[_candidateId].doesExist,
            "Candidate Does not exists"
        );
        voters[msg.sender].hasVoted = true;
        voters[msg.sender].candidateIDVote = _candidateId;
        candidates[_candidateId].voteCount++;
        totalVotes++;
        // trigger voted event
        // @todo
    }

    function myVote() public {
        uint256 candidate = voters[msg.sender].candidateIDVote;
        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i] == candidate) {
                return candidates[i];
            }
        }
    }

    function getCandidateVotes(uint256 candidateID) public returns (uint256) {
        uint256 numOfVotes = 0; // we will return this
        for (uint256 i = 0; i < totalVotes; i++) {
            // if the voter votes for this specific candidate, we increment the number
            if (voters[i].candidateIDVote == candidateID) {
                numOfVotes++;
            }
        }
        return numOfVotes;
    }

    function getResults() public returns (uint256) {}

    function getUsersVote(address userAddress) public {
        for (uint256 i = 0; i < voters.length; i++) {
            if (voters[i].userAddress == userAddress) {
                getCandidate(voters[i].candidateIDVote);
            }
        }
    }

    // returns candidate information, including its ID, name, and party
    function getCandidate(uint256 candidateID)
        public
        view
        returns (
            uint256,
            bytes32,
            bytes32
        )
    {
        return (
            candidateID,
            candidates[candidateID].name,
            candidates[candidateID].voteCount
        );
    }

    function getVoteMap() public {
        return voters;
    }
}
