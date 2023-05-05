*** Settings ***
Library    AppiumLibrary
Library    RequestsLibrary
Library    Collections
Library    String
Library    OperatingSystem
Library    XML
Resource    ../Resources/keywords.robot
Resource    ../Resources/xpaths.robot

*** Test Cases ***
SMT-72 Successful Signing
    Prompt PIN2
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true    
    Wait Until Element Is Visible    ${Modal}
    Click Element        ${Confirm1}
    Wait Until Element Is Visible    ${Num1}
    Enter PIN2
    Get Session Status

SMT-73 Cancel Signing and Sign Again
    Prompt PIN2
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true
    Wait Until Element Is Visible    ${Modal}
    Click Element        ${Confirm1}
    Wait Until Element Is Visible    ${Cancel}
    Click Element    ${Cancel}
    Wait Until Element Is Visible    ${Ignore}
    Click Element    ${Ignore}
    Get Session Status
    # Start signing the second time
    Prompt PIN2
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true
    Wait Until Element Is Visible    ${Modal}
    Click Element        ${Confirm1}
    Wait Until Element Is Visible    ${Num1}
    Enter PIN2
    Get Session Status
    
SMT-76 Enter Wrong PIN2 (2 times)
    Prompt PIN2
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true
    Wait Until Element Is Visible    ${Modal}
    Click Element        ${Confirm1}
    Wait Until Element Is Visible    ${Num1}
    Enter Wrong PIN2
    Sleep    2 s
    Enter Wrong PIN2
    Sleep    2 s
    Click Element    ${OK_wrong_PIN}
    Sleep    2 s
    Enter PIN2
    Get Session Status

SMT-54 Successful Authentication
    Prompt PIN1
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true
    Wait Until Element Is Visible    ${Modal}
    Click Element        ${Confirm1}
    Wait Until Element Is Visible    ${Num1}
    Enter PIN1
    Get Session Status

SMT-56 Cancel Authentication and Authenticate Again
    Prompt PIN1
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true
    Wait Until Element Is Visible    ${Modal}
    Click Element        ${Confirm1}
    Wait Until Element Is Visible    ${Cancel}
    Click Element    ${Cancel}
    Wait Until Element Is Visible    ${Ignore}
    Click Element    ${Ignore}
    Get Session Status
    # Start authenticating the second time
    Prompt PIN1
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true
    Wait Until Element Is Visible    ${Modal}
    Click Element        ${Confirm1}
    Wait Until Element Is Visible    ${Num1}
    Enter PIN1
    Get Session Status

SMT-59 Enter wrong PIN1 (2 times)
    Prompt PIN1
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true
    Wait Until Element Is Visible    ${Modal}
    Click Element        ${Confirm1}
    Wait Until Element Is Visible    ${Num1}
    Enter Wrong PIN1
    Sleep    2 s
    Enter Wrong PIN1
    Sleep    2 s
    Click Element    ${OK_wrong_PIN}
    Sleep    2 s
    Enter PIN1
    Get Session Status
How to use Smart-ID can be clicked through
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.stagnationlab.sk  appActivity=com.stagnationlab.sk.MainActivity  automationName=Uiautomator2  noReset=true
    Sleep    5 s
    Click Element    ${Help}
    Wait Until Element Is Visible    ${HelpModal}
    Click Element    ${HowTo}
    Wait Until Element Is Visible    ${HowToModal}
    Click Element    ${Help_OK}
    Wait Until Element Is Visible    ${Help_Next_Modal}
    Click Element    ${Help_Next}
    Click Element    ${Help_Next}
    Click Element    ${Help_Next}
    Wait Until Element Is Visible    ${NoThanks_Modal}
    Click Element    ${NoThanks}
    Wait Until Element Is Visible    ${Done_Modal}
    Click Element    ${Done} 