Given(/^I visit the menu page$/) do
  visit '/'
end

Given(/^the following dishes exist$/) do |table|
  table.hashes.each do |dish|
    binding.pry
    Dish.create(dish)
  end
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^show me the page$/) do
  save_and_open_page
end

Then(/^dish prices$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
