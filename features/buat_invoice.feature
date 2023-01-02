Feature: User makes 1 new Invoice

  Scenario Outline: Verifying that the user can make at least 1 Invoice with Pay Off Later.
    Given User already login with credentials record <record>
    And User log into Fitur Khusus function
    When User fill the form & make Invoice
    And User choose Pay Off Later
    Then User succeeded make one invoice & the invoice diplayed on Invoice List

    Examples:
      |record|
      |record1|