Feature: Greeting cards management
  As an administrator user
  I want to be able to manage kiitos
  So users can use them to send kiitos to other users

  Scenario: An administrator user
    Given the following categories are predefined:
      |category name|
      |love         |
      |ownership    |
      |honor        |
    And I am an administrator "admin@test.com"
    And I sign in as "admin@test.com"
    When I go to kiitos management panel
    Then I should be able to create the following valid kiitos:
      |title               |category   |description|state    |image name|
      |I am grateful       |love       |blablabla  |Enabled  |test1     |
      |You are a gentleman |honor      |           |Disabled |test2     |
      |Mr Lieutenant       |honor      |           |Enabled  |test2     |
      |You are the man     |ownership  |Boooom!    |Enabled  |test3     |
    And I should not be able to create the following invalid kiitos:
      |title               |category   |description|state    |image name|
      |                    |love       |blablabla  |Enabled  |test1     |
      |You are a gentleman |           |           |Disabled |test2     |
      |You are the man     |ownership  |Boooom!    |Enabled  |          |
    And I should be able to modify the "You are a gentleman" kiito with:
      |title                       |category   |description|state    |image name|
      |You are an honorable leader |honor      |           |Disabled |test2     |
    And I should enable/disable following cards:
      |title                       |state    |
      |I am grateful               |Disabled |
      |You are an honorable leader |Enabled  |


