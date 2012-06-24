Given /^I am on the home page$/ do
  visit "/"
end

When /^I add task "(.*?)"$/ do |task_description|
  fill_in 'new_task', with: task_description
end

When /^I submit form$/ do
  page.evaluate_script("document.forms[0].submit()")
end

Then /^I should see "(.*?)" in incomplete tasks list$/ do |task_description|
  page.should have_xpath("//div[@id='incompleted']/ul/li[contains(., '#{task_description}')]")
end
