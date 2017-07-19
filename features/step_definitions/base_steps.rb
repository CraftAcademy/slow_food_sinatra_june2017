Given(/^I visit the menu page$/) do
  visit '/'
end

Given(/^the following dishes exist$/) do |table|
  table.hashes.each do |dish|
    dish[:price] = dish[:price].to_i
    category = Category.first(name: dish['category'])
    dish['category'] = category
    Dish.create(dish)
  end
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^show me the page$/) do
  save_and_open_page
end

Given(/^the following categories exist$/) do |table|
  table.hashes.each do | category |
    Category.create(category)
  end
end

Given(/^I click on the "([^"]*)" button$/) do |button|
  first(:button, button).click
end

Then(/^I should see "([^"]*)" in my cart$/) do |dish|
  within('div#shopping-cart') do
    expect(page).to have_content dish
  end
end

Then(/^I should see "([^"]*)" in element "([^"]*)"$/) do |text, cssClass|
  within('.'+cssClass) do
    expect(page).to have_content text
  end
end

Given(/^I add items to my cart$/) do
  first(:button, button).click
end

Then(/^I should see the "([^"]*)"$/) do |content|
    expect(page).to have_content content
end

Given(/^I log in using "([^"]*)" and "([^"]*)"$/) do |username, password|
  visit '/auth/login'
  find('#username').set(username)
  find('#password').set(password)
  click_link_or_button('Log In')
end
