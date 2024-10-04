*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem  # Ensure this is added
Resource    ../resources/Variable.robot
Resource    ../resources/Keyword.robot



*** Test Cases ***
GET user list
    Create Directory    result  # สร้างโฟลเดอร์ result ถ้าไม่มี
    ${response}=    GET    ${API_URL_USER_LISTS}
    Should Be Equal As Numbers    ${response.status_code}    200  # ตรวจสอบว่าสถานะตอบกลับเป็น 200
    ${users}=    Set Variable    ${response.json()}  # จัดเก็บการตอบกลับ JSON ทั้งหมดเป็นรายการของผู้ใช้

    # บันทึกข้อมูลทั้งหมดลงใน result.json
    Write Users To Json    ${users}    ${RESULT_PATH_USEER_LISTS}
