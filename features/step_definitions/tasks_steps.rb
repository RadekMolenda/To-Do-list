Given /^I am on the home page$/ do
  visit "/"
end

When /^I add task "(.*?)"$/ do |task_description|
  fill_in 'new_task', with: task_description
end

When /^I submit form$/ do
  find(:xpath, "//input[@type='submit']").click
end

Then /^I should see "(.*?)" in incomplete tasks list$/ do |task_description|
  page.should have_xpath("//ul[@id='incompleted']/li[contains(.,'#{task_description}')]")
end
