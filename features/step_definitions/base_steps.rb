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

Then(/^I should see the "([^"]*)" in my cart$/) do |dish|
  within('div#shopping_cart') do
    expect(page).to have_content dish
  end
end
