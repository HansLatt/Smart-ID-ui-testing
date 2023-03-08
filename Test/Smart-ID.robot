*** Settings ***
Library    AppiumLibrary
Library    RequestsLibrary
Library    Collections
Library    String
Library    OperatingSystem
Library    XML

*** Variables ***
${Num2}        com.android.calculator2:id/digit_2
#${headers}     Create Dictionary    Content-Type=application/json
#${body}        Z:/\UITest/\ui_test/\Resources/\jsonBody.txt    encoding=UTF-8    encoding_errors=strict
${Confirm}      xpath=(//*[@content-desc='Confirm'])
${Confirm1}       xpath=(//*[@content-desc='Confirm'])
${Num1}         xpath=(//android.widget.Button[@content-desc='1'])
#${Confirm3}       xpath=(//view.View[@content-desc='Confirm details'])
#${Num1}    xpath=(//*[@content-desc='1'])


*** Test Cases ***
#Test
#    ${body}    Get File   Z:/\UITest/\ui_test/\Resources/\jsonBody.json    encoding=UTF-8    encoding_errors=strict
#    Log To Console    ${body}
Signing
    ${headers}     Create Dictionary    Content-Type=application/json; charset=utf-8
    ${json}    Get File   Z:/\UITest/\ui_test/\Resources/\jsonBody.json    encoding=UTF-8    encoding_errors=strict
    POST    https://sid.demo.sk.ee/smart-id-rp/v2/signature/etsi/PNOEE-39802180031    data=${json}    headers=${headers}
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true
    Click Element    ${Confirm}
    Element click    ${Confirm1}
    Log To Console    testing1
    #Enter PIN2
    

*** Keywords ***
Element click
    [Arguments]    ${Xpath_value}
    Wait Until Page Contains Element    ${Xpath_value}    timeout=10s    error=The element did not appear before timeout
    Click Element    ${Xpath_value}
    
#Enter PIN2
#    Click Element    ${Num1}

    