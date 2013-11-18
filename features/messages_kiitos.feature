Feature: Messages kiitos section
  As a signed up user
  I want to see the messages dashboard
  So I can see all the kiitos sent through me

  Background:
    Given an administrator user exists
    And the following users exist:
      |User Email       |name      |
      |user1@test.com   |User1     |
      |user2@test.com   |User2     |
      |user3@test.com   |User3     |
    And the following kiitos exist:
      |title               |category   |description|state    |image     |
      |I am grateful       |1          |blablabla  |enabled  |test1     |
      |You are a gentleman |2          |           |disabled |test2     |
    And the following categories are predefined:
      |category name|
      |joy          |
      |endurance    |
    And the following kiitos were sent:
      |From Email     |To Email       | Greeting Card Title        |Message                 | When?        |
      |user2@test.com |user1@test.com | I'm grateful               |My customized message 1 | 1.day.ago    |
      |user3@test.com |user1@test.com | You are a gentleman        |My customized message 2 | 1.day.ago    |

  Scenario: A user sends a kiito to another user from the host application users pool
    When I sign in as "user1@test.com"
    Then I go to kiitos messages dashboard
    Then I should see the following kiitos:
      | Category |
      | endurance |
    When I click on the first received kiito
    Then I should see "1 time received"