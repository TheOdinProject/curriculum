Feature: Confirming the users account

  Scenario: Unconfirmed user after 2 day grace period
    Given I have a unconfirmed account that is over 2 days old
    When I try to login
    Then a message will be displayed instructing me to confirm my email
