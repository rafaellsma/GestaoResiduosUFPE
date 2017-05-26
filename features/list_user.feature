Feature: List all users to admin

  Scenario: list all unapproved users
    Given Exists 3 unapproved users
    And I am logged as admin
    When I am on users list page
    And I click in unapproved users list
    Then I see 3 users

  Scenario: list all approved users
    Given Exists 3 approved users
    And I am logged as admin
    When I am on users list page
    And I click in approved users list
    Then I see 3 users

  Scenario: list users when users don't exist
    Given Exists 0 approved users
    And I am logged as admin
    When I am on users list page
    And I click in approved users list
    Then I see 0 users
    And I see "Não existe nenhum usuário"
