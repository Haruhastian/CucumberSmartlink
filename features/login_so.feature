Feature: Logging into SmartOwner Website

  Scenario Outline: Verifying that the user can login into the website
    Given User open the website in browser
    When User login with credentials <username> and <password>
    Then User succeeded login into the website

    Examples:
    |username|password|
    |alfa.alkaaf@gmail.com|citridia2014,
    |alfa.alkaaf@gmail.com|owner2020maulewat|