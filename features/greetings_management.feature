Feature: Greeting cards management
  As an administrator user
  I want to be able to manage greeting cards
  So users can use them to send greetings to other users

  Scenario: An administrator user
    Given following categories are predefined:
      |category name|
      |love         |
      |ownership    |
      |honor        |
    And I am an administrator
    And I am signed in
    When I go to greeting cards management panel
    Then I should be able to create the following valid greeting cards:
      |title               |category   |description|state    |image name|
      |I'm grateful        |love       |blablabla  |enabled  |test1     |
      |You are a gentleman |honor      |           |disabled |test2     |
      |Mr Lieutenant       |honor      |           |enabled  |test2     |
      |You are the man     |ownership  |Boooom!    |enabled  |test3     |
    And I should not be able to create the following invalid greeting cards:
      |title               |category   |description|state    |image name|
      |                    |love       |blablabla  |enabled  |test1     |
      |You are a gentleman |           |           |disabled |test2     |
      |You are the man     |ownership  |Boooom!    |enabled  |          |
    And I should be able to modify the "You are a gentleman" greeting card with:
      |title                      |category   |description|state    |image name|
      |You are a honorable leader |honor      |           |disabled |test2     |
    And I should enable/disable following cards:
      |title               |state    |
      |I'm grateful        |disable  |
      |You are a gentleman |enabled  |


