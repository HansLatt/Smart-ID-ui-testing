*** Settings ***
Library  AppiumLibrary

*** Variables ***
${Num2}         com.android.calculator2:id/digit_2
${Add}          com.android.calculator2:id/op_add
${EQ}           com.android.calculator2:id/eq
${ResultField}  com.android.calculator2:id/formula

*** Test Cases ***
Open_Application
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=HYFDU19109010558  appPackage=com.android.calculator2  appActivity=com.android.calculator2.Calculator  automationName=Uiautomator2
    Add two plus two
    Element Should Contain Text   ${ResultField}  5

*** Keywords ***
Add two plus two
    Click Element  ${Num2}
    Click Element  ${Add} 
    Click Element  ${Num2}
    CLick Element  ${EQ}