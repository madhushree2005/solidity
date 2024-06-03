// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Election {
    address public admin;
    enum ElectionState { NOT_STARTED, ONGOING, ENDED }
    ElectionState public state;

   
    struct Candidate {
        uint id;
        string name;
        string proposal;
        uint votes;
    }

    struct Voter {
        bool hasVoted;
        bool hasDelegated;
        address delegate;
        uint vote;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => Voter) public voters;

    
    event NewCandidate(uint id, string name, string proposal);
    event ElectionStarted();
    event ElectionEnded();
    event VoteCast(address indexed voter, uint candidateId);
    event VoteDelegated(address indexed from, address indexed to);
    event WinnerAnnounced(uint candidateId, string name, uint votes);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    modifier onlyDuringElection() {
        require(state == ElectionState.ONGOING, "Election is not ongoing");
        _;
    }

    modifier onlyNotVoted() {
        require(!voters[msg.sender].hasVoted, "You have already voted");
        _;
    }

    
    constructor() {
        admin = msg.sender;
        state = ElectionState.NOT_STARTED;
    }

   
    function addCandidate(string memory _name, string memory _proposal) external onlyAdmin {
        
    }

    function addVoter(address _voter) external onlyAdmin {
        
    }

    function startElection() external onlyAdmin {
        
    }

    function endElection() external onlyAdmin onlyDuringElection {
       
    }
function castVote(uint _candidateId) external onlyDuringElection onlyNotVoted {
        
    }

    function delegateVote(address _delegate) external onlyDuringElection onlyNotVoted {
        
    }

    function showCandidateDetails(uint _candidateId) external view returns (uint, string memory, string memory) {
    }
    function showWinner() external view returns (uint, string memory, uint) {
        
    }

    function showElectionResults(uint _candidateId) external view returns (uint, string memory, uint) {
        
    }

    function viewVoterProfile() external view returns (string memory, uint, bool) {
        
    }
}


