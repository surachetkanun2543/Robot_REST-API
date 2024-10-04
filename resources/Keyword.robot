
*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    Variable.robot
Library    OperatingSystem  # Ensure this is added



*** Keywords ***
Get API Response
    Create Session    my_api    ${API_URL}
    ${response}=    GET    ${API_URL}
    [Return]    ${response.json()}

Write Users To Json
    [Arguments]    ${users}    ${file_path}
    ${json_data}=    Evaluate    json.dumps(${users}, indent=4)    json
    Create File    ${file_path}    ${json_data}
    Log    User data saved to JSON file


Write Response To File
    [Arguments]    ${response}
    ${user}=    Get From Dictionary    ${response}    user
    ${content}=    Set Variable    ID: ${user['id']}\nFirst Name: ${user['fname']}\nLast Name: ${user['lname']}\nUsername: ${user['username']}\nAvatar: ${user['avatar']}
    Append To File    ${OUTPUT_FILE}    ${content}
