Feature: Admin approves unapproved user

  Scenario: Approve a unapproved user
    Given Exists 1 unapproved users
    And I am logged as admin
    When I am on users list page
    And I click in unapproved users list
    And I click in approve
    Then I see 0 users
    And I click in approved users list
    And I see 1 users
