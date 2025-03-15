*** Settings ***
Library    SeleniumLibrary
Resource   saucedemo_resources.robot

Test Setup    Open Browser To Login Page
Test Teardown    Close Browser

*** Test Cases ***
User successfully completes checkout
    Given the user is logged into SauceDemo
    When the user adds a product to the cart
    And the user proceeds to checkout
    And the user fills in checkout details
    Then the order is successfully placed
