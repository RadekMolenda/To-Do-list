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

When /^I set the deadline to "(.*?)"$/ do |date|
  fill_in "deadline", with: date
end

Then /^I should see the deadline "(.*?)"$/ do |date|
  page.should have_xpath("//ul[@id='incompleted']/li/span[contains(.,'#{date}')]")
end

Given /^I have an incomplete task "(.*?)" in the database$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I click on element "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I fill in "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I click on "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
