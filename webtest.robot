*** Settings ***
Library       SeleniumLibrary
Library          FakerLibrary


*** Variables ***
${LOGIN URL}        https://demo.finansysapps.id/
${BROWSER}        Chrome


*** Test Cases ***

Allow user to create an application on the platform
    ${faker_name}=        FakerLibrary.first_name
    GIVEN As a user of the form editor page of the demo website    system        P@ssw0rd123# 
    WHEN I provide valid application name        ${faker_name}       
    THEN An application is created for me

Invalid application name
    GIVEN As a user of the form editor page of the demo website    system        P@ssw0rd123# 
    WHEN I provide valid application name        text      
    THEN I see an appropriate error message


*** Keywords ***
As a user of the form editor page of the demo website   
    [Arguments]    ${args1}    ${args2}
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath://*[@alt="FinanSys Apps"]
    Input Text    name:email    ${args1}
    Input Text    id:password    ${args2}
    Click Element    id:kt_login_signin_submit

I provide valid application name 
    [Arguments]    ${args1}    
    Wait Until Element Is Visible    xpath://*[@href="/form-editor"]
    Click Element    xpath://*[@href="/form-editor"]
    Wait Until Element Is Visible    xpath://button[@class="btn btn-success"]    20
    Click Element    xpath://button[@class="btn btn-success"]
    Wait Until Element Is Visible    xpath://input[@placeholder="Enter name"]
    Input Text    xpath://input[@placeholder="Enter name"]    ${args1} 
    Input Text    xpath://textarea[@name="description"]    text
    Click Element    xpath://*[text()="Select..."]
    Wait Until Element Is Visible    //*[@id = 'react-select-2-option-0' and (text() = 'Demonstration' or . = 'Demonstration')]
    Click Element    //*[@id = 'react-select-2-option-0' and (text() = 'Demonstration' or . = 'Demonstration')]
    Click Element    xpath://*[@type="submit"]
An application is created for me
    Wait Until Element Is Visible    xpath://*[@aria-label="Save"]    60
    Close Browser

I see an appropriate error message
    Wait Until Element Is Visible    xpath://*[text()="Name: text is reserved system name, please use another name"]
    Close Browser
    
    
    
    

