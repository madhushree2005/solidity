// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JobPortal {
    address public admin;
    
    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can call this function");
       _;
    }

    struct Applicant {
        uint256 applicantId;
        string name;
        string email;
        string applicationType;
        uint256 rating;
    }

    mapping(uint256 => Applicant) public applicants;
    uint256 public nextApplicantId = 1;
struct JobPosting {
        uint256 jobId;
        string title;
        address employer;
        bool isOpen;
    }

    mapping(uint256 => JobPosting) public jobPostings;
    uint256 public nextJobId = 1;

    modifier jobExists(uint256 _jobId) {
        require(jobPostings[_jobId].isOpen, "Job does not exist or is closed");
        _;
    }

    function addApplicant(string memory _name, string memory _email, string memory _applicationType) external onlyAdmin {
        Applicant memory newApplicant = Applicant({
            applicantId: nextApplicantId,
            name: _name,
            email: _email,
            applicationType: _applicationType,
            rating: 0
        });

        applicants[nextApplicantId] = newApplicant;
        nextApplicantId++;
    }
         function getApplicantDetails(uint256 _applicantId) external view returns (Applicant memory) {
        return applicants[_applicantId];
    }

    function getApplicantType(uint256 _applicantId) external view returns (string memory) {
        return applicants[_applicantId].applicationType;
    }

    function addJob(string memory _title) external onlyAdmin {
        JobPosting memory newJob = JobPosting({
            jobId: nextJobId,
            title: _title,
            employer: msg.sender,
            isOpen: true
        });

        jobPostings[nextJobId] = newJob;
        nextJobId++;

        
    }

    function getJobDetails(uint256 _jobId) external view jobExists(_jobId) returns (JobPosting memory) {
        return jobPostings[_jobId];
    }

    function applyForJob(uint256 _jobId, uint256 _applicantId) external jobExists(_jobId) {
        
       
    }

    function provideRating(uint256 _applicantId, uint256 _rating) external onlyAdmin {
        require(_rating >= 0 && _rating <= 10, "Invalid rating. Must be between 0 and 10");
        
        applicants[_applicantId].rating = _rating;

        
    }

    function getApplicantRating(uint256 _applicantId) external view returns (uint256) {
        return applicants[_applicantId].rating;
    }
}

