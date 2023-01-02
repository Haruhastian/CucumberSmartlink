Feature: Login into SmartOwner Website

#  Scenario Outline: Verifying that the user can login into the website
#    Given User open the website in browser
#    When User login with credentials record <record>
#    Then User succeeded login into the website
#
#    Examples:
#      |record|
#      |record1|
#      |record2|

    @scenario_2
  Scenario Outline: Verifying that the user can login into the website
    Given User open the website in browser
    When User login with credentials record <record>
    Then User succeeded login into the website

      Examples:
        |record|
        |record1|