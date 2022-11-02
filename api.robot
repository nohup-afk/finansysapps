*** Settings ***
Library           RequestsLibrary
Library           Collections

Suite Setup        Get token

*** Variables ***
${url}    https://demo.finansysapps.id
${userid}      /api/form/Editor/ListApplications

*** Test Cases ***
Validate body shoud be valid
    Get Detail User Id


*** Keywords ***
Get token   
    Create Session    userapi    ${url}
    ${headers}=    Create Dictionary    Content-Type=application/json
    POST On Session    userapi    /api/identity/authentication/authenticate     data={"username":"system","password":"P@ssw0rd123#"}  headers=${headers}
    ${resp}=    Get On Session    userapi    api/identity/authentication/isauthenticated      headers=${headers}
    # Log To Console    ${resp.json()}[data][token]
    ${token}=    Get From Dictionary    ${resp.json()['data']}    token
    Set Suite Variable    ${token}


Get Detail User Id
    Create Session    userapi    ${url}
    ${headers}=    Create Dictionary    Content-Type=application/json     Authorization=Bearer ${token}
    ${resp}=    Get On Session    userapi    ${userid}    headers=${headers}
    # Log To Console    ${resp.json()['data']['Uncategorised'][0]}[module_name]
    Should Be Equal As Strings       ${resp.json()['data']['Uncategorised'][0]}[application_module_category_id]               None
    Should Be Equal As Strings       ${resp.json()['data']['Uncategorised'][0]}[category_name]                                None
    Should Be Equal As Strings       ${resp.json()['data']['Uncategorised'][0]}[created_by]                                67f98a25aadf4e779d5b218fa34881bf
    Should Be Equal As Strings       ${resp.json()['data']['Uncategorised'][0]}[created_on]                                2022-07-21T08:28:40.995473
    Should Be Equal As Strings       ${resp.json()['data']['Uncategorised'][0]}[display_name]                                Uncategorised App
    Should Be Equal As Strings       ${resp.json()['data']['Uncategorised'][0]}[id]                                         995529b38cf4460dbcda061774b8646f
    Should Be Equal As Strings       ${resp.json()['data']['Uncategorised'][0]}[module_name]                                         uncategorised_app

    
