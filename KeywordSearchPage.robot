*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/VariableSearchPage.robot

*** Keywords ***
Open webbrower
    Set Selenium Speed         0.1s
    Open Browser               ${url}    ${browser}
    Wait Until Page Contains   Kru P' Beam    1s
    Maximize Browser Window

Input data for login to search Page
    Input Text                 ${locator_emaillogin}      user.test@krupbeam.com
    Input Text                 ${locator_passwordlogin}   123456789
    Click Element              ${locator_btnlogin}
    Wait Until Page Contains   Search Filters             5s

Select Search Filter List Role
    Click Element                    ${locator_Select-Role}
    Wait Until Element Is Visible    ${locator_Select-Role-admin}      5s
    Click Element                    ${locator_Select-Role-admin}

Select Search Filter List Role-sub
    Click Element                    ${locator_Select-Role}
    Wait Until Element Is Visible    ${locator_select-role-sub}      5s
    Click Element                    ${locator_select-role-sub}     

 Select Search Filter List plan
    Click Element                    ${locator_Select-Plan}
    Wait Until Element Is Visible    ${locator_Select-Plan-team}       5s
    Click Element                    ${locator_Select-Plan-team}  

Select Search Filter List plan-Basic
    Click Element                    ${locator_Select-Plan}
    Wait Until Element Is Visible    ${locator_Select-Plan-basic}       5s
    Click Element                    ${locator_Select-Plan-basic}  

Select Search Filter List status
    Click Element                    ${locator_Select-Status}
    Wait Until Element Is Visible    ${locator_Select-status-active}   5s
    Click Element                    ${locator_Select-status-active}     

Select Filters lits for search
    Open webbrower
    Input data for login to search Page
    [Arguments]    ${role1}    ${plan1}    ${status1}
    IF  ${role1} ==1
        Select Search Filter List Role
    END
    IF  ${plan1} ==1
         Select Search Filter List plan
    END
    IF  ${status1} ==1
        Select Search Filter List status
    END
    Click Element    ${locator_btnsearch}
    Sleep    3s
    Close Browser

Click Clear Button for Clear select list
    Open webbrower
    Input data for login to search Page
    [Arguments]    ${role1}    ${plan1}    ${status1}
    IF  ${role1} ==1
        Select Search Filter List Role
    END
    IF  ${plan1} ==1
         Select Search Filter List plan
    END
    IF  ${status1} ==1
        Select Search Filter List status
    END
    Click Element    ${locator_btnclear}
    Sleep    3s
    Close Browser

Input data for add user -Pass
    Input Text            ${locator_firstname}             wisarut
    Input Text            ${locator_lastname}              Chuduang
    Input Text            ${locator_email}                 wisarut.chud@gmail.com
    Input Text            ${locator_password}              123456789
    Input Text            ${locator_mobilephone}           0836480441
    Select Radio Button   ${locator_Gender}                male
    Select Checkbox       ${locator_chkSQL}   
    Select Checkbox       ${locator_chkTest}   
    Select Checkbox       ${locator_ChkAutomate1}   
    Select Checkbox       ${locator_ChkAutomate2}  
    Select List Nationality
    Select List courses
    Select List Plan
    Click Element    ${locator_btnsignupforadduser}
    Wait Until Page Contains    Register Success    5s
    Click Element    ${locator_btnok}
    Wait Until Page Contains    Search Filters
    Select Search Filter List Role-sub
    Select Search Filter List plan-Basic
    Click Element    ${locator_btnsearch}
    Wait Until Page Contains    wisarut.chud@gmail.com
    Sleep    5s

Select List courses
    Click Element    ${locator_select-role}
    Wait Until Element Is Visible    ${locator_select-role-list}    5s
    Click Element    ${locator_select-role-list}

 Select List Nationality
    Click Element    ${locator_nationality}
    Wait Until Element Is Visible    ${locator_nationality-THAI}    5s
    Click Element    ${locator_nationality-THAI}   

Select List Plan
    Click Element    ${locator_selectplan}
    Wait Until Element Is Visible    ${locator_Selectplan2}         5s
    Click Element    ${locator_Selectplan2} 

Verify error msg 
    [Arguments]    ${locator}    ${mgs}=${EMPTY}
    ${txt}=    Get Text    ${locator}
    Should Be Equal As Strings    ${txt}    ${mgs}

Input data add user Fail - test template
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${mobile}    ${gender}    ${chkbox}    ${nation}    ${role}    ${plan}    ${locator1}    ${msg1}
    Open webbrower
    Input data for login to search Page
    Click Element               ${locator_btnAdduser} 
    Wait Until Page Contains    Form User
    Input Text                  ${locator_firstname}       ${firstname}
    Input Text                  ${locator_lastname}        ${lastname}
    Input Text                  ${locator_email}           ${email}
    Input Text                  ${locator_password}        ${password}
    Input Text                  ${locator_mobilephone}     ${mobile}
    IF  "${gender}" != "emp"
        Select Radio Button     ${locator_Gender}          ${gender}
    END
    IF    ${chkbox} == 1    
    Select Checkbox             ${locator_chkSQL}   
    ELSE IF    ${chkbox} == 2    
    Select Checkbox             ${locator_chkSQL}  
    Select Checkbox             ${locator_chkTest} 
    ELSE IF    ${chkbox} == 3    
    Select Checkbox             ${locator_chkSQL}  
    Select Checkbox             ${locator_chkTest}   
    Select Checkbox             ${locator_ChkAutomate1}   
    ELSE IF    ${chkbox} == 4    
    Select Checkbox             ${locator_chkSQL}  
    Select Checkbox             ${locator_chkTest}   
    Select Checkbox             ${locator_ChkAutomate1}  
    Select Checkbox             ${locator_ChkAutomate2}  
    END
    IF  ${nation} ==1
        Select List Nationality
    END
    IF  ${role} ==1
        Select List courses
    END
    IF  ${plan} ==1
        Select List Plan
    END
    Click Element               ${locator_btnsignupforadduser}
    Verify error msg            ${locator1}    ${msg1}
    Close Browser

Reset data
    Input Text                  ${locator_firstname}        wisarut
    Input Text                  ${locator_lastname}         Chuduang
    Input Text                  ${locator_email}            wisarut.chud@gmail.com
    Input Text                  ${locator_password}         123456789
    Input Text                  ${locator_mobilephone}      0836480441
    Select Radio Button         ${locator_Gender}           male
    Select Checkbox             ${locator_chkSQL}   
    Select Checkbox             ${locator_chkTest}   
    Select Checkbox             ${locator_ChkAutomate1}   
    Select Checkbox             ${locator_ChkAutomate2}  
    Select List Nationality
    Select List courses
    Select List Plan
    Double Click Element        ${locator_reset}

Verify Tap Rows per Page
    Click Element                          ${locator_btnsearch}
    Click Element                          ${locator_rowperpage}
    Click Element                          ${locator_rowperpage-25}
    Wait Until Page Contains               1–25 of
    Click Element                          ${locator_nextpage}
    Wait Until Element Is Visible          ${locator_Previouspage}    5s
    Click Element                          ${locator_Previouspage}
    Sleep                                  5s

Verify Icon Notifications and Profile
    Click Element                    ${locator_notificatios}
    Wait Until Element Is Visible    ${locator_btnreadallnoti}    5s
    Click Element                    ${locator_btnreadallnoti}  
    click Element                    ${locator_profile}
    Wait Until Element Is Visible    ${locator_btnlogout}    5s
    Click Element                    ${locator_btnlogout}     
    Wait Until Page Contains         Welcome to Kru P' Beam!
    Sleep                            3s
    




 