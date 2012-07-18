Feature: Tasks
  As a User I want to have a simple tasks management software to know what is really important to me

  Background:
    #It will be single page app so all the scenarios starts at Home page
    Given I am on the home page

  @javascript
  Scenario: Adding simple tasks
    When I add task "Make tea"
    And I submit form
    Then I should see "Make tea" in incompleted tasks list

  @javascript
  Scenario: Editing Task
    Given I have an incomplete task "Make cake" in the database
    When I click on element ".description"
    And I fill in "edit-description" with "Make delicious cake"
    And I click on button "save"
    Then I should see "Make delicious cake" in incompleted tasks list

  @javascript
  Scenario: Canceling editing Task
    Given I have an incomplete task "Make cake" in the database
    When I click on element ".description"
    And I fill in "edit-description" with "Make delicious cake"
    And I click on button "cancel"
    Then I should see "Make cake" in incompleted tasks list

  @javascript
  Scenario: Deleting incomplete Task
    Given I have an incomplete task "Make cake" in the database
    When I click on element ".delete"
    Then I should not see "Make cake"

  @javascript
  Scenario: Deleting completed Task
    Given I have a completed task "Make cake" in the database
    When I click on element ".delete"
    Then I should not see "Make cake"

  @javascript
  Scenario: Marking a task as done
    Given I have an incomplete task "Make cake" in the database
    And I click on element ".done"
    Then I should see "Make cake" in completed tasks list

  @javascript
  Scenario: Marking a done task as not done
    Given I have a completed task "Make cake" in the database
    And I click on element ".not-done"
    Then I should see "Make cake" in incompleted tasks list

