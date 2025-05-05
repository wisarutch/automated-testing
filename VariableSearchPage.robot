*** Variables ***
${url}                           https://automate-test.stpb-digital.com/login/ 
${browser}                        Chrome
${locator_emaillogin}            id=email
${locator_passwordlogin}         name=password
${locator_btnlogin}              id=btn-login
${locator_Select-Role}           id=select-role
${locator_Select-Plan}           id=select-plan
${locator_Select-Status}         id=select-status
${locator_btnclear}              id=btn-clear
${locator_btnsearch}             id=btn-search
${locator_btnAdduser}            xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a
${locator_backtosearchpage}      xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button
${locator_Select-Role-admin}     id=option-select-role-1
${locator_Select-Plan-team}      id=option-select-plan-4
${locator_Select-Plan-basic}     xpath=//*[@id="option-select-plan-1"]
${locator_Select-status-active}  id=option-select-status-2
${locator_firstname}             id=firstname 
${locator_lastname}              id=lastname 
${locator_Gender}                validation-basic-radio
${locator_select-role}           id=select-role
${locator_select-role-list}      xpath=//*[@id="menu-"]/div[3]/ul/li[5]
${locator_select-role-sub}       id=option-select-role-5
${locator_btnsignup}             id=btn-sign-up
${locator_reset}                 id=reset
${locator_email}                 id=email 
${locator_password}              id=password
${locator_mobilephone}           id=mobile-phone
${locator_chkSQL}                name=courses.SQL
${locator_chkTest}               name=courses.Test Manual
${locator_ChkAutomate1}          name=courses.Automate Test 
${locator_ChkAutomate2}          name=courses.Automate Test2
${locator_nationality}           id=nationality
${locator_nationality-THAI}      xpath=//*[@id="menu-"]/div[3]/ul/li[221]
${locator_selectplan}            id=select-plan
${locator_Selectplan2}           xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_err-firstname}         id=error-firstname
${locator_err-lastname}          id=error-lastname
${locator_err-email}             id=error-email     
${locator_err-password}          id=error-password
${locator_err-mobilephone}       id=error-mobile-phone
${locator_err-Gender}            id=validation-basic-gender
${locator_err-courses}           id=validation-basic-courses
${locator_err-nationality}       id=validation-basic-nationality
${locator_err-select-role}       id=validation-role
${locator_err-SelectPlan}        id=validation-plan
${locator_btnok}                 id=btn-ok
${locator_btnsignupforadduser}   xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/button  
${locator_nextpage}              css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(2) > div > div.MuiDataGrid-root.MuiDataGrid-autoHeight.css-rx2f15 > div:nth-child(3) > div > div.MuiTablePagination-root.css-u1jk8u > div > div.MuiTablePagination-actions > button:nth-child(2) > svg
${locator_Previouspage}          css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(2) > div > div.MuiDataGrid-root.MuiDataGrid-autoHeight.css-rx2f15 > div:nth-child(3) > div > div.MuiTablePagination-root.css-u1jk8u > div > div.MuiTablePagination-actions > button:nth-child(1) > svg
${locator_rowperpage}            xpath=/html/body/div[1]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]/div
${locator_rowperpage-25}         xpath=html/body/div[3]/div[3]/ul/li[2]
${locator_notificatios}          css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > header > div > div > div.actions-right.MuiBox-root.css-70qvj9 > button > svg
${locator_profile}               xpath=/html/body/div[1]/div[1]/div[2]/header/div/div/div[2]/span/div/img
${locator_btnreadallnoti}        css=body > div.MuiModal-root.MuiPopover-root.css-bdbmf5 > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li.MuiMenuItem-root.MuiMenuItem-gutters.MuiButtonBase-root.css-1p3ebxb > button
${locator_btnlogout}             css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li