*** Settings ***
Library            SeleniumLibrary
Resource           ${CURDIR}/VariableSearchPage.robot
Resource           ${CURDIR}/KeywordSearchPage.robot
Suite Setup        Set Selenium Speed    5s
Suite Teardown     Close All Browsers
Test Setup         Open webbrower
Test Teardown      Close Browser



*** Test Cases ***
TC001 - login to Search Page
    [Documentation]    กรอก Email และ password เพื่อ Login เข้าสู่หน้าจอ Search Page
    [Tags]    done
    Input data for login to search Page

TC002 - Select Filters lits for search
    [Documentation]    ทดสอบการเลือก Dropdown list
    [Template]    Select Filters lits for search
    [Tags]    done
    [Setup]
    0    0    0    
    1    0    0
    0    1    0
    0    0    1
    1    1    0
    1    0    1
    0    1    1
    1    1    1
    [Teardown]

TC003 - Clear button
    [Documentation]    ทดสอบการกดปุ่ม Clear button  เพื่อล้างข้อมูล  Dropdown list ที่เลือกไว้
    [Tags]    done
    Click Clear Button for Clear select list     1    1    1

TC004 - Add User - Pass
    [Documentation]    ใช้สำหรับการเพิ่ม User ในระบบ
    [Tags]    done
    Input data for login to search Page
    Click Element    ${locator_btnAdduser}
    Input data for add user -Pass

TC005 - Add User - fail
    [Documentation]    ใช้สำหรับทดสอบในกรณีกรอกข้อมูลไม่ครบถ้วน 
    [Template]    Input data add user Fail - test template
    [Tags]    done12
    [Setup]
    ${EMPTY}   chuduang     wisarut@gmail.com    123456    0863658554    male        4    1    1    1        ${locator_err-firstname}    This field is required      
    wisarut    ${EMPTY}     wisarut@gmail.com    123456    0863658554    male        1    1    1    1        ${locator_err-lastname}     This field is required
    wisarut    chuduang     ${EMPTY}             123456    0863658554    male        1    1    1    1        ${locator_err-email}        This field is required
    wisarut    chuduang     wisarut@gmail.com    ${EMPTY}  0863658554    male        1    1    1    1        ${locator_err-password}     This field is required
    wisarut    chuduang     wisarut@gmail.com    123456    ${EMPTY}      male        1    1    1    1        ${locator_err-mobilephone}  This field is required
    wisarut    chuduang     wisarut@gmail.com    123456    0863658554    emp         1    1    1    1        ${locator_err-Gender}       This field is required
    wisarut    chuduang     wisarut@gmail.com    123456    0863658554    male        0    1    1    1        ${locator_err-courses}      This field is required
    wisarut    chuduang     wisarut@gmail.com    123456    0863658554    male        1    0    1    1        ${locator_err-nationality}  This field is required
    wisarut    chuduang     wisarut@gmail.com    123456    0863658554    male        1    1    0    1        ${locator_err-select-role}  This field is required
    wisarut    chuduan      wisarut@gmail.com    123456    0863658554    male        1    1    1    0        ${locator_err-SelectPlan}   This field is required
    [Teardown]

TC006 Add User - Reset data
    [Documentation]    ทดสอบการกด Hyperlink Reset  เพื่อล้างข้อมูลทั้งหมดที่ทำการกรอกไว้
    [Tags]    done14
    Input data for login to search Page
    Click Element    ${locator_btnAdduser}
    reset data

TC007 Back to Search Page
    [Documentation]    ทดสอบการกด Back ในหน้า Form User เพื่อกลับสู่หน้าจอ Search Page
    [Tags]    done
    Input data for login to search Page
    Click Element    ${locator_btnAdduser}
    Click Element    ${locator_backtosearchpage}
    sleep    3s    

TC008 Verify Tap Rows per Page
    [Documentation]    ตรวจสอบในส่วนของ tap Rows per page ว่า แสดง Page ได้ถูกต้อง 
    [Tags]    done
    Input data for login to search Page
    # กด next page สามารถไปยังหน้าต่อไปได้ และ เมื่อกด Previous page สามารถกลับไปยังหน้าก่อนหน้าได้
    Verify Tap Rows per Page

TC009 Verify Icon Notifications and Profile
    [Documentation]     ตรวจสอบในส่วนของการกดไอคอน Notifications and Profile
    Input data for login to search Page
    # กดไอคอน Notifications เพื่อแสดงการแจ้งเตือนทั้งหมด  และ กดไอคอน Profile จะแสดงชื่อของผู้ใช้งาน สามารถกด logout เพื่อออกจากระบบและกลับสู่หน้าจอหลัก
    Verify Icon Notifications and Profile

   
