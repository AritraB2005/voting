// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DecentralizedVoting {
    address public admin;
    uint public proposalCount;

    struct Proposal {
        uint id;
        string description;
        uint voteCount;
        bool exists;
    }

    struct Voter {
        bool registered;
        mapping(uint => bool) hasVoted; // proposalId => true/false
    }

    mapping(address => Voter) private voters;
    mapping(uint => Proposal) private proposals;

    // Events
    event VoterRegistered(address voter);
    event ProposalCreated(uint proposalId, string description);
    event Voted(address voter, uint proposalId);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    modifier onlyRegistered() {
        require(voters[msg.sender].registered, "Not a registered voter");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    /// Admin registers a voter
    function registerVoter(address _voter) external onlyAdmin {
        require(!voters[_voter].registered, "Already registered");
        voters[_voter].registered = true;
        emit VoterRegistered(_voter);
    }

    /// Admin adds a new proposal
    function addProposal(string calldata _description) external onlyAdmin {
        proposalCount++;
        proposals[proposalCount] = Proposal(proposalCount, _description, 0, true);
        emit ProposalCreated(proposalCount, _description);
    }

    /// Voter casts a vote for a proposal
    function vote(uint _proposalId) external onlyRegistered {
        require(proposals[_proposalId].exists, "Proposal does not exist");
        require(!voters[msg.sender].hasVoted[_proposalId], "Already voted on this proposal");

        proposals[_proposalId].voteCount++;
        voters[msg.sender].hasVoted[_proposalId] = true;

        emit Voted(msg.sender, _proposalId);
    }

    /// Public view: Get vote count and description of a proposal
    function getProposal(uint _proposalId) external view returns (string memory description, uint voteCount) {
        require(proposals[_proposalId].exists, "Proposal does not exist");
        Proposal memory p = proposals[_proposalId];
        return (p.description, p.voteCount);
    }

    /// Public view: Check if a user has voted on a proposal
    function hasUserVoted(address _voter, uint _proposalId) external view returns (bool) {
        return voters[_voter].hasVoted[_proposalId];
    }

    /// Public view: Check if a user is registered
    function isRegistered(address _user) external view returns (bool) {
        return voters[_user].registered;
    }
}

