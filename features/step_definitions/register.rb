Given(/^that I can see the menu page$/) do
  visit '/'
end

When(/^I click the "([^"]*)" link$/) do |link_text|
  click_link(link_text)
end

Then(/^I want to be "([^"]*)" to the register customer page$/) do |arg1|
  visit('/auth/register')
end
