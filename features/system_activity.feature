Feature: System Activity
  As a signed up user
  I want to see an activity dashboard
  So I can see all the kiitos sent through the company

  @javascript
  Scenario: A user sees all kiitos sent in the last month
    Given the following categories are predefined:
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
    When I go to the system activity's page
    And I sign in as "paco@test.com"
    Then I should see the following kiitos:
      |From Email    |To Email      | Greeting Card Title        |Message                 | When?        |
      |hugo@test.com |paco@test.com | I'm grateful               |My customized message 1 | 1.day.ago    |
    And I should not see the following kiitos:
      |From Email    |To Email      | Greeting Card Title        |Message                 | When?        |
      |luis@test.com |hugo@test.com | I'm grateful               |My customized message 4 | 2.months.ago |
