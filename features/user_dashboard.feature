Feature: User Dashboard
  As a signed up user
  I want to have a dashboard
  So I can see all my received greeting cards

  Scenario: A user sees his received greeting cards
    Given an administrator user exists
    And the following categories are predefined:
      |category name|
      |joy          |
      |endurance    |
    And the following greeting cards exist:
      |title               |category   |description|state    |image name|
      |I'm grateful        |joy        |blablabla  |enabled  |test1     |
      |You are a gentleman |endurance  |           |disabled |test2     |
    And the following users exist:
      | User Email   |
      |hugo@test.com |
      |paco@test.com |
      |luis@test.com |
    And the following greeting cards were sent:
      |From Email    |To Email      | Greeting Card Title        | When?        |
      |hugo@test.com |paco@test.com | I'm grateful               | Today        |
      |luis@test.com |paco@test.com | You are a gentleman        | 1 day ago    |
      |luis@test.com |hugo@test.com | You are a gentleman        | Today        |
      |luis@test.com |hugo@test.com | I'm grateful               | 2 months ago |

    When I sign in as "luis@test.com"
    Then I should have "0" greeting cards

    When I sign in as "hugo@test.com"
    Then I should have the following ordered greeting cards:
      | Order | Greeting Card Title        |
      | 1     | You are a gentleman        |

    When I increase the search span to "2" months
    Then I should have the following ordered greeting cards:
      | Order | Greeting Card Title        |
      | 1     | You are a gentleman        |
      | 2     | I'm grateful               |

    When I sign in as "paco@test.com"
    Then I should see my user's dashboard
    And I should have the following ordered greeting cards:
      | Order | Greeting Card Title        |
      | 1     | I'm grateful               |
      | 2     | You are a gentleman        |
