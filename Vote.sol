// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.15;

contract OptimizedVote {


    struct Voter {
        uint8 vote;
        bool voted;
    }

    struct Proposal {
        bytes32 name;
        uint8 voteCount;
        bool ended;
    }

    mapping(address => Voter) voters;

    Proposal[] proposals;

    function createProposal(bytes32 _name) external {

    Proposal memory proposal;
    proposal.name = _name;
    proposals.push(proposal);  
    }

    function vote(uint8 _proposal) external {

        Voter storage voter = voters[msg.sender];
        require(!voter.voted, 'already voted');
        
        voter.vote = _proposal;
        voter.voted = true;
        proposals[_proposal].voteCount++;
    }

    function getVoteCount(uint8 _proposal) external view returns (uint8) {
        return proposals[_proposal].voteCount;
    }
}
