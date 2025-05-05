*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                        https://automate-test.stpb-digital.com/register/
${brower}                     Chrome
${locator_reset}              id=reset
${locator_firstname}          id=firstname 
${locator_lastname}           id=lastname 
${locator_email}              id=email 
${locator_password}           id=password
${locator_mobilephone}        id=mobile-phone
${locator_Gender}             validation-basic-radio
${locator_ChkAutomate1}       name=courses.Automate Test 
${locator_nationality}        id=nationality
${locator_nationality-Thai}   xpath=//*[@id="menu-"]/div[3]/ul/li[221]
${locator_select-role}        id=select-role
${locator_select-role-list}   xpath=//*[@id="menu-"]/div[3]/ul/li[5]
${locator_SelectPlan}         id=select-plan
${locator_SelectPlan=team}    xpath=//*[@id="menu-"]/div[3]/ul/li[4]
${locator_btnsignup}          id=btn-sign-up
${locator_btnok}              id=btn-ok
${locator_err-firstname}      id=error-firstname
${locator_err-lastname}       id=error-lastname
${locator_err-email}          id=error-email     
${locator_err-password}       id=error-password
${locator_err-mobilephone}    id=error-mobile-phone
${locator_err-Gender}         id=validation-basic-gender
${locator_err-courses}        id=validation-basic-courses
${locator_err-nationality}    id=validation-basic-nationality
${locator_err-select-role}    id=validation-role
${locator_err-SelectPlan}     id=validation-plan


*** Keywords ***
Open webbrower
    Set Selenium Speed            0.5s
    Open Browser        ${url}    ${brower}
    Wait Until Page Contains      Kru P' Beam    3s
    Maximize Browser Window

Input data for Register
    Input Text    ${locator_firstname}           wisarut
    Input Text    ${locator_lastname}            Chuduang
    Input Text    ${locator_email}               wisarut.chud@gmail.com
    Input Text    ${locator_password}            123456789
    Input Text    ${locator_mobilephone}         0836480441
    Select Radio Button     ${locator_Gender}    male 
    Select List courses
    Select List Nationality
    Select List Role
    Select List Plan
     
Select List courses
    Wait Until Page Contains    Automate Test    3s
    Select Checkbox    ${locator_ChkAutomate1}

 Select List Nationality
    Click Element    ${locator_nationality}
    Wait Until Element Is Visible    ${locator_nationality-Thai}
    Click Element    ${locator_nationality-Thai}  

Select List Role
    Click Element    ${locator_select-role}
    Wait Until Element Is Visible    ${locator_select-role-list}
    Click Element    ${locator_select-role-list}

Select List Plan
    Click Element    ${locator_SelectPlan}
    Wait Until Element Is Visible    ${locator_SelectPlan=team}
    Click Element    ${locator_SelectPlan=team}

Not input data for Required field
    Input Text    ${locator_firstname}    ${EMPTY}
    Input Text    ${locator_lastname}    ${EMPTY}
    Input Text    ${locator_email}    ${EMPTY}
    Input Text    ${locator_password}    ${EMPTY}
    Input Text    ${locator_mobilephone}    ${EMPTY}
   
Input data for Invalid email format
    Input Text    ${locator_firstname}           wisarut
    Input Text    ${locator_lastname}            Chuduang
    Input Text    ${locator_email}               wisarut.chudgmail.com
    Input Text    ${locator_password}            123456789
    Input Text    ${locator_mobilephone}         0836480441
    Select Radio Button     ${locator_Gender}    male 
    Select List courses
    Select List Nationality
    Select List Role
    Select List Plan
   
*** Test Cases ***
TC001 - Register Page
    Open webbrower 
    Close Browser

TC002 - input data Pass
    Open webbrower
    Input data for Register
    Click Element    ${locator_btnsignup}
    Wait Until Page Contains    Register Success
    Click Element    ${locator_btnok}
    Wait Until Page Contains    Welcome to Kru P' Beam!
    Close Browser

TC003 - Input data for Invalid email format   
    Open webbrower
    Input data for Invalid email format
    Click Element    ${locator_btnsignup}
    ${txt1}=    Get Text    ${locator_err-email}
    Should Be Equal As Strings    ${txt1}    Invalid email address
    Close Browser

TC004 - Hyperlink Reset Input data
    Open webbrower
    Input data for Register
    Click Element    ${locator_reset}
    Close Browser

TC005 - Not input data for Required field
    Open webbrower
    Not input data for Required field
    Click Element    ${locator_btnsignup}
    ${txt1}=    Get Text    ${locator_err-firstname}
    Should Be Equal As Strings    ${txt1}    This field is required
    ${txt2}=    Get Text    ${locator_err-lastname}
    Should Be Equal As Strings    ${txt2}    This field is required
    ${txt3}=    Get Text    ${locator_err-email}
    Should Be Equal As Strings    ${txt3}    This field is required
    ${txt4}=    Get Text    ${locator_err-password}
    Should Be Equal As Strings    ${txt4}    This field is required
    ${txt5}=    Get Text    ${locator_err-mobilephone}
    Should Be Equal As Strings    ${txt5}    This field is required
    ${txt6}=    Get Text    ${locator_err-Gender}
    Should Be Equal As Strings    ${txt6}    This field is required
    ${txt7}=    Get Text    ${locator_err-courses}
    Should Be Equal As Strings    ${txt7}    This field is required
    ${txt8}=    Get Text    ${locator_err-nationality}
    Should Be Equal As Strings    ${txt8}    This field is required
    ${txt9}=    Get Text    ${locator_err-select-role}
    Should Be Equal As Strings    ${txt9}    This field is required
    ${txt10}=    Get Text    ${locator_err-SelectPlan}
    Should Be Equal As Strings    ${txt10}    This field is required
    Close Browser




