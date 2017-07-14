Given(/^that I can see the menu page$/) do
  visit '/'
end

When(/^I click "([^"]*)"$/) do |text|
  click_link_or_button(text)
end

Then(/^I want to be "([^"]*)" to the register customer page$/) do |arg|
  visit('/register')
end

Given(/^that I am on the "([^"]*)" page$/) do |arg1|
  visit('/register')
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

Then(/^I should see "([^"]*)"$/) do |content|
  visit('/')
  expect(page).to have_content content
end
