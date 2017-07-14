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
