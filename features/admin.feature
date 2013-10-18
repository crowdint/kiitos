@javascript
Feature: Admin Dashboard
  As an admin
  I want to be able to access the admin dashboard
  So that I can manage Kiitos and Users

  Background:
    Given the host application has the following user:
      |email            |name      |
      |user1@test.com   |User1     |
      |user2@test.com   |User2     |
      And The user "user1@test.com" is an administrator in the kiitos application

  Scenario: Accessing the admin dashboard
    Given I am signed in on the host application as "user1@test.com"
     When I sign in on the kiitos application as "user1@test.com"
      And I click on "Admin"
     Then I should see the admin dashboard

  Scenario: Can't view the admin dashboard if you are not an admin
    Given I am signed in on the host application as "user2@test.com"
     When I sign in on the kiitos application as "user2@test.com"
     Then I should not see a link to the admin dashboard
