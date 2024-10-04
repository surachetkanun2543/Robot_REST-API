*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           OperatingSystem

*** Variables ***
${BASE_URL}               https://www.melivecode.com/api
${API_URL_USER_LISTS}     ${BASE_URL}/users

*** Test Cases ***
GET User List
    [Documentation]    ทดสอบการดึงข้อมูลผู้ใช้ทั้งหมด
    Create Directory    result    # สร้างโฟลเดอร์ result ถ้าไม่มี
    ${response}=    GET    ${API_URL_USER_LISTS}
    Should Be Equal As Numbers    ${response.status_code}    200  # ตรวจสอบว่าสถานะตอบกลับเป็น 200
    Log    ${response.json()}  # แสดงผลข้อมูลผู้ใช้ใน log
