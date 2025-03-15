*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}           https://www.saucedemo.com
${USERNAME}      standard_user
${PASSWORD}      secret_sauce
${FIRST_NAME}    John
${LAST_NAME}     Doe
${POSTAL_CODE}   12345

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

The user is logged into SauceDemo
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=inventory_container

The user adds a product to the cart
    Click Button    xpath=//button[contains(text(),'Add to cart')]
    Click Element    id=shopping_cart_container
    Wait Until Page Contains Element    class=cart_list

The user proceeds to checkout
    Click Button    id=checkout
    Wait Until Page Contains Element    id=first-name

The user fills in checkout details
    Input Text    id=first-name    ${FIRST_NAME}
    Input Text    id=last-name    ${LAST_NAME}
    Input Text    id=postal-code    ${POSTAL_CODE}
    Click Button    id=continue
    Wait Until Page Contains Element    id=checkout_summary_container
    Click Button    id=finish

The order is successfully placed
    Wait Until Page Contains    Thank you for your order!
