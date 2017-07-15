Given(/^that I can see the menu page$/) do
  visit '/'
end

When(/^I click "([^"]*)"$/) do |text|
  click_link_or_button(text)
end

Then(/^I want to be redirected to the register customer page$/) do
  visit('/register')
end

Given(/^that I am on the registration page$/) do
  visit('/register')
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I am Redirected to the main page$/) do
  visit('/')
end

When(/^show me page$/) do
  save_and_open_page
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Given(/^I am on main page$/) do
  visit('/')
end

#Given(/^show page$/) do
#  save_and_open_page
#end

When(/^I click the link "([^"]*)"$/) do |login|
  click_link_or_button(login)
end

Then(/^I want to be redirected to the login customer page$/) do
  visit('/auth/login')
end

When(/^i want to fill in "([^"]*)"$/) do |username|
  fill_in field, with: username
end

When(/^I want to fill in "([^"]*)"$/) do |password|
  fill_in field, with: password
end

Then(/^I want o see a message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
