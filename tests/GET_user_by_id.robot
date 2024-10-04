*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../resources/Variable.robot
Resource    ../resources/Keyword.robot
Library    OperatingSystem  # Ensure this is added


*** Test Cases ***
GET user by id
    Create Directory    result  # สร้างโฟลเดอร์ result ถ้าไม่มี
    ${response}=    Get API Response
    Write Response To File    ${response}
    # ตรวจสอบความถูกต้องของข้อมูล
    ${user}=    Get From Dictionary    ${response}    user
    Should Be Equal As Numbers    ${user['id']}    ${EXPECTED_ID}
    Should Be Equal    ${user['fname']}    ${EXPECTED_FNAME}
    Should Be Equal    ${user['lname']}    ${EXPECTED_LNAME}
    Should Be Equal    ${user['username']}    ${EXPECTED_USERNAME}
    Should Be Equal    ${user['avatar']}    ${EXPECTED_AVATAR}

