Feature: Tasks
  As a User I want to have a simple tasks management software to know what is really important to me

  As a developer. In order to get job in Quipper I want to make a single page application to impress quipper tech staff.

  Background:
    #It will be single page app so all the scenarios starts at Home page
    Given I am on the home page

    @javascript
  Scenario: Adding simple tasks
    When I add task "Make tea"
    And I submit form
    Then I should see "Make tea" in incompleted tasks list

    @javascript
  Scenario: Adding tasks with deadline
    When I add task "Make coffee"
    And I set the deadline to "2012-12-01 15:00:00"
    And I submit form
    Then I should see "Make coffee" in incompleted tasks list

    @javascript
  Scenario: Editing Task
    Given I have an incomplete task "Make cake" in the database
    When I click on element ".description"
    And I fill in "Make delicious cake"
    And I click on "save"
    Then I should see "Make delicious cake" in incompleted tasks list
