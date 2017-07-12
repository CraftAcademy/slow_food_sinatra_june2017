Given(/^I am on the landing page$/) do
  visit '/'
end

When(/^I click "([^"]*)"$/) do |link_text|
  click_link_or_button link_text
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Given(/^that there are no users in the system$/) do
  User.first.destroy if User.any?
end

And(/^the following users exist$/) do |table|
  table.hashes.each do |user_instance|
    User.create(user_instance)
  end
end

Then(/^show me the page$/) do
  save_and_open_page
end

Given(/^the following menus exist$/) do |table|
  table.hashes.each do |menu|
    Menu.create(menu)
  end
end
