*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${HEADLESS}    false

*** Test Cases ***
Create Quote for Car
    Open Insurance Application
    Enter Vehicle Data for Automobile
    Enter Insurant Data
    Enter Product Data
    Select Price Option
    Send Quote
    End Test

*** Keywords ***
Open Insurance Application
    Open Browser    http://sampleapp.tricentis.com/    ${BROWSER}    headless=${HEADLESS}
    Maximize Browser Window

Enter Vehicle Data for Automobile
    Click Element    xpath=//div[@class='main-navigation']//a[text()='Automobile']
    Select From List By Label    id=make    Audi
    Input Text    id=engineperformance    110
    Input Text    id=dateofmanufacture    06/12/1980
    Select From List By Label    id=numberofseats    5
    Select From List By Label    id=fuel    Petrol
    Input Text    id=listprice    30000
    Input Text    id=licenseplatenumber    DMK1234
    Input Text    id=annualmileage    10000
    Click Button    xpath=//button[text()='Next »']

Enter Insurant Data
    [Arguments]    ${firstname}=Max    ${lastname}=Mustermann
    Input Text    id=firstname    ${firstname}
    Input Text    id=lastname    ${lastname}
    Input Text    id=birthdate    01/31/1980
    Click Element    id=gendermale
    Input Text    id=streetaddress    Test Street
    Select From List By Label    id=country    Germany
    Input Text    id=zipcode    40123
    Input Text    id=city    Essen
    Select From List By Label    id=occupation    Employee
    Click Element    xpath=//input[@id='cliffdiving']/following-sibling::label
    Click Button    xpath=//button[text()='Next »']

Enter Product Data
    Input Text    id=startdate    06/01/2023
    Select From List By Label    id=insurancesum    7.000.000,00
    Select From List By Label    id=meritrating    Bonus 1
    Select From List By Label    id=damageinsurance    No Coverage
    Click Element    id=EuroProtection
    Select From List By Label    id=courtesycar    Yes
    Click Button    xpath=//button[text()='Next »']

Select Price Option
    [Arguments]    ${price_option}=Silver
    Click Element    xpath=//input[@value='${price_option}']/following-sibling::label
    Click Button    xpath=//button[text()='Next »']

Send Quote
    Input Text    xpath=//input[@id='email']    max.mustermann@example.com
    Input Text    xpath=//input[@id='phone']    0049201123456
    Input Text    xpath=//input[@id='username']    max.mustermann
    Input Text    xpath=//input[@id='password']    SecretPassword123!
    Input Text    xpath=//input[@id='confirmpassword']    SecretPassword123!
    Input Text    xpath=//textarea[@id='Comments']    Some comments
    Click Button    xpath=//button[text()='Send »']
    Wait Until Element Is Visible    xpath=//div[contains(text(), 'Sending e-mail success!')]
    Click Button    xpath=//button[text()='OK']

End Test
    Close All Browsers
