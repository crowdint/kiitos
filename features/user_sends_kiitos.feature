Feature: A user sends kiitos
  As a signed up user
  I want to send kiitos to other users
  So they feel good about their daily jobs

  Background:
    Given an administrator user exists
    And the following users exist:
      |User Email       |name      |
      |user1@test.com   |User1     |
      |user2@test.com   |User2     |
    And the following kiitos exist:
      |title               |category   |description|state    |image     |
      |I'm grateful        |1          |blablabla  |enabled  |test1     |
      |You are a gentleman |2          |           |disabled |test2     |
    And the following categories are predefined:
      |category name|
      |joy          |
      |endurance    |

  Scenario: A user sends a kiito to another user from the host application users pool
    When I sign in as "user1@test.com"
    When I fill in the send kiito form with:
      |to               |message                         |kiito       |
      |user2@test.com   |Thanks for being the way you are|I'm grateful|
    Then The user "user2@test.com" should have the "I'm grateful" kiito in his received messages

  Scenario: A user cannot send a kiito to self
    When I sign in as "user1@test.com"
    Then I should not see the user "user1@test.com"
