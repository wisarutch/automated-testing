*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}        http://automate-test.stpb-digital.com/
${browser}    Chrome
${locator_email}    id=email
${locator_password}  name=password
${locator_btnlogin}    id=btn-login
${locator_msg_email}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_msg_login}   css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > div.MuiBox-root.css-1fobf8d > h5
${locator_msg_password}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_msg_required field}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_Hyperlink}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a > a
${locator_loginfail}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p

*** Keywords ***
Open Web browser
    Set Selenium Speed    1s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input data for login page pass
    
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locator_btnlogin}

 Input data for login page fail
    
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Text    ${locator_password}    1234567
    Click Element    ${locator_btnlogin}   

 Input data for email fail
    
    Input Text    ${locator_email}    Admin@ดหกดกห
    Input Text    ${locator_password}    123456789
    Click Element    ${locator_btnlogin}

 Input data for password fail
    
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Text    ${locator_password}    123
    Click Element    ${locator_btnlogin}

Input data for login page req
    
    Input Text    ${locator_email}    ${EMPTY}
    Input Text    ${locator_password}    ${EMPTY}
    Click Element    ${locator_btnlogin}

*** Test Cases ***
TC001 - Login page
    Open Web browser
    Wait Until Page Contains       Welcome to Kru P' Beam!
    Close Browser

TC002 - Input data email Fail
    Open Web browser
     Input data for email fail
         ${txt}=    Get Text    ${locator_msg_email}
    Should Be Equal As Strings    ${txt}    email must be a valid email
    Close Browser

TC003 - Input password fail
    Open Web browser
     Input data for password fail
           ${txt}=    Get Text    ${locator_msg_password}
    Should Be Equal As Strings    ${txt}    password must be at least 5 characters
    Close Browser

TC004 - login pass
    Open Web browser
    Input data for login page pass
    Wait Until Page Contains       Kru P' Beam
    Close Browser   

TC005 - login Fail
    Open Web browser
      Input data for login page fail
    ${txt}=    Get Text    ${locator_loginfail}
    Should Be Equal As Strings    ${txt}    Email or Password is invalid
    Close Browser

TC006 - Not input data for Required field
    Open Web browser
    Input data for login page req
       ${txt}=    Get Text    ${locator_msg_required field}
    Should Be Equal As Strings    ${txt}    email is a required field
    Close Browser

TC007 - Hyperlink
    Open Web browser
    Click Element    ${locator_Hyperlink}
    Wait Until Location Is    https://automate-test.stpb-digital.com/register/
    Close Browser












