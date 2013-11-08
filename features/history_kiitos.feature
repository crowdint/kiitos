Feature: History kiitos section
  As a signed up user
  I want to see the history dashboard
  So I can see all the kiitos sent through me

  Scenario: "The user should be able to see all the kiitos"
    Given an administrator user exists
    And the following categories are predefined:
      |category name|
      |joy          |
      |endurance    |
    And the following kiitos exist:
      |title               |category   |description|state    |image     |
      |I'm grateful        |1          |blablabla  |enabled  |test1     |
      |You are a gentleman |2          |           |disabled |test2     |
    And the following users exist:
      | User Email   |name      |
      |hugo@test.com |Hugo Test |
      |paco@test.com |Paco Test |
      |luis@test.com |luis      |
    And the following kiitos were sent:
      |From Email    |To Email      | Greeting Card Title        |Message                 | When?        |
      |hugo@test.com |paco@test.com | I'm grateful               |My customized message 1 | 1.day.ago    |
      |luis@test.com |paco@test.com | You are a gentleman        |My customized message 2 | 1.day.ago    |
      |luis@test.com |hugo@test.com | You are a gentleman        |My customized message 3 | 1.day.ago    |
      |luis@test.com |hugo@test.com | I'm grateful               |My customized message 4 | 2.months.ago |
    When I sign in as "paco@test.com"
    Then I go to kiitos history dashboard
    Then I should have "2" kiitos
    When I click on the first received kiito
    Then I should see "2 times received"
