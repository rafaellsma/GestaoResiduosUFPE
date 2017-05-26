Feature: Admin disapproves approved user

  Scenario: disapproves a approved user
    Given Exists 1 approved users
    And I am logged as admin
    When I am on users list page
    And I click in approved users list
    And I click in disapprove
    Then I see 0 users
    And I click in unapproved users list
    And I see 1 users
