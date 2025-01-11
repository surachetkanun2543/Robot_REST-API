Robot Framework for API Testing

Project Overview
This project automates REST API testing using Robot Framework, integrated into a Jenkins pipeline for continuous testing. The goal is to validate API endpoints, ensuring functionality and performance through automated tests.

Features

Automated Testing: Robot Framework tests API endpoints using the HTTP library.
Jenkins Integration: Tests are triggered in Jenkins for continuous testing.
Reporting: Test results and logs are generated after execution.
Prerequisites

Robot Framework and required libraries like RequestsLibrary or HTTP.
Jenkins for running tests.
Pipeline Stages

Prepare Test Data: Ensure API test data is available.
Install Dependencies: Install required libraries.
Run Tests: Execute the Robot Framework test suite.
Generate Reports: Generate and archive test reports in Jenkins.
Usage Instructions

Configure Jenkins to trigger the Robot Framework tests.
Ensure the test files are accessible.
Trigger the job and access the reports.
License
Licensed under the MIT License.
