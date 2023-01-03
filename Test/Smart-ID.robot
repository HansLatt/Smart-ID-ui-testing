*** Settings ***
Library    AppiumLibrary
Library    RequestsLibrary
Library    Collections
Library    String


*** Variables ***
${Num2}        com.android.calculator2:id/digit_2
${headers}     Create Dictionary    Content-Type    application/json
${body}        Get File    C:\Users\hans.latt\Desktop\jsonBody.json    encoding=UTF-8    encoding_errors=strict


*** Test Cases ***
Signing
    POST    https://sid.demo.sk.ee/smart-id-rp/v2/signature/etsi/PNOEE-39802180031    json=${body}    headers=${headers}
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2


*** Keywords ***
Add two plus two
    Click Element  ${Num2}
    Click Element  ${Add} 
    Click Element  ${Num2}
    CLick Element  ${EQ}