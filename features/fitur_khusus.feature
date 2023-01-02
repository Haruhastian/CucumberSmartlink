Feature: Click on Fitur Khusus for Smart Owner

  Scenario Outline: Verifying that the user can access the Fitur Khusus
    Given User already login with credentials record <record>
    When User log into Fitur Khusus function
    Then The page of Fitur Khusus is displayed

    Examples:
    |record|
    |record1|