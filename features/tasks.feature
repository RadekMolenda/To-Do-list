Feature: Tasks
  As a User I want to have a simple tasks management software to know what is really important to me

  As a developer. In order to get job in Quipper I want to make a single page application to impress quipper tech staff.

  Background:
    #It will be single page app so all the scenarios starts at Home page
    Given I am on the home page

  Scenario: Creating simple tasks
    When I add task "Make tea"
    And I hit enter
    Then I should see "Make tea" in incomplete tasks list
