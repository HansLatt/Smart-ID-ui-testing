*** Settings ***
Library    OperatingSystem
Library    Process
Library    AppiumLibrary
Library    String
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    ../Resources/xpaths.robot

*** Variables ***

${id_code}    39802180031

*** Keywords ***
Get Session Status
    ${status}    GET    https://sid.demo.sk.ee/smart-id-rp/v2/session/${response.json()}[sessionID]
    Log To Console    Session status: ${status.json()}[result]
    
Prompt PIN2
    ${headers}     Create Dictionary    Content-Type=application/json; charset=utf-8
    ${json}    Get File   ../\Resources/\jsonBody.json    encoding=UTF-8    encoding_errors=strict
    ${response}    POST    https://sid.demo.sk.ee/smart-id-rp/v2/signature/etsi/PNOEE-${id_code}    data=${json}    headers=${headers}
    Status Should Be    200
    Set Test Variable    ${response}
    
Prompt PIN1
    ${headers}     Create Dictionary    Content-Type=application/json; charset=utf-8
    ${json}    Get File   ../\Resources/\jsonBody.json    encoding=UTF-8    encoding_errors=strict
    ${response}    POST    https://sid.demo.sk.ee/smart-id-rp/v2/authentication/etsi/PNOEE-${id_code}    data=${json}    headers=${headers}
    Status Should Be    200
    Set Test Variable    ${response}

Enter PIN1
     Click Element    ${Num1}
     Click Element    ${Num4}
     Click Element    ${Num1}
     Click Element    ${Num7}

Enter PIN2
    Click Element    ${Num1}
    Click Element    ${Num4}
    Click Element    ${Num1}
    Click Element    ${Num4}
    Click Element    ${Num7}

Enter Wrong PIN1
    Click Element    ${Num1}
    Click Element    ${Num4}
    Click Element    ${Num3}
    Click Element    ${Num7}

Enter Wrong PIN2
    Click Element    ${Num1}
    Click Element    ${Num4}
    Click Element    ${Num1}
    Click Element    ${Num3}
    Click Element    ${Num7}