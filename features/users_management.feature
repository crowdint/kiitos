Feature: Users management
  As an administrator user
  I want to be able to manage users
  So other administrator users can collaborate

  Background:
    Given the host application has the following user:
      |email          |name    |
      |test@test.com  |Ledi    |

  Scenario: The first logged in user becomes the administrator
    Given there are no administrator users in the kiitos application
    And I am signed in on the host application
    When I sign in on the kiitos application
    Then I should become an administrator
    And land in the administrator panel

  Scenario: An administrator adds more users from the host application users pool
    Given I am an administrator
    And I am signed in
    When I go to the users management panel
    Then I should be able to see the host application users pool
    And I should be able to promote a user to admin
    And I should be able to degrade a user from admin
