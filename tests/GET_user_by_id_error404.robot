*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Resource    ../resources/Variable.robot
Resource    ../resources/Keyword.robot


*** Test Cases ***
GET user by id check error status404
    # Create a session for the API
    Create Session    melive    https://www.melivecode.com
    
    # Send the request using the session and get the response
    ${response}=    Get Request    melive    /api/users/100
    Should Be Equal As Numbers    ${response.status_code}    404  # ตรวจสอบว่าสถานะตอบกลับเป็น 404
    
    # Log the response details for debugging
    Log To Console    ${response.status_code}
    Log To Console    ${response.text}

    # Validate JSON content in the response
    ${response_json}=    To Json    ${response.text}
    Dictionary Should Contain Value    ${response_json}    error
    Dictionary Should Contain Value    ${response_json}    User with ID = 100 not found
    
    # Save the response JSON into a result file
    Write Users To Json    ${response_json}    ${OUTPUT_FILE}


*** Variables ***
${OUTPUT_FILE}    result/result.json
