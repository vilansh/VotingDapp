// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Voting {
    string public candidate1 = "Lokesh";
    string public candidate2 = "Vilansh";

    uint public votesCandidate1;
    uint public votesCandidate2;

    mapping(address => bool) public hasVoted;

    function vote(uint _candidate) public {
        require(!hasVoted[msg.sender], "You have already voted!");

        if (_candidate == 1) {
            votesCandidate1++;
        } else if (_candidate == 2) {
            votesCandidate2++;
        } else {
            revert("Invalid candidate selected.");
        }

        hasVoted[msg.sender] = true;
    }

    function getVotes() public view returns (uint, uint) {
        return (votesCandidate1, votesCandidate2);
    }
}
