Given /^I am on the home page$/ do
  visit "/"
end

When /^I add task "(.*?)"$/ do |task_description|
  fill_in 'new_task', with: task_description
end

When /^I submit form$/ do
  find(:xpath, "//input[@type='submit']").click
end

Then /^I should see "(.*?)" in incompleted tasks list$/ do |task_description|
  page.should have_xpath("//ul[@id='incompleted']/li[contains(.,'#{task_description}')]")
end

Then /^I should see "(.*?)" in completed tasks list$/ do |task_description|
  page.should have_xpath("//ul[@id='completed']/li[contains(.,'#{task_description}')]")
end

When /^I set the deadline to "(.*?)"$/ do |date|
  fill_in "deadline", with: date
end

Then /^I should see the deadline "(.*?)"$/ do |date|
  page.should have_xpath("//ul[@id='incompleted']/li/span[contains(.,'#{date}')]")
end

Given /^I have an incomplete task "(.*?)" in the database$/ do |description|
  Task.create(description: description)
end

When /^I click on element "(.*?)"$/ do |element|
  find(element).click
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in field, :with => value
end

When /^I click on button "(.*?)"$/ do |button|
  find_button(button).click
end
Then /^I should not see "(.*?)"$/ do |content|
  page.should_not have_content content
end
Given /^I have a completed task "(.*?)" in the database$/ do |description|
  Task.create!(description: description, completed: true)
end
