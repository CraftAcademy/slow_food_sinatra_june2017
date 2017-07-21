When(/^I visit the "([^"]*)" page$/) do |page_name|
  case page_name
  when 'index'
  when 'menu'
    visit '/'
  else
    raise "This page doesn't exist"
  end
end

When(/^I add "([^"]*)" to the shopping cart$/) do |dish_name|
  dish = Dish.first(name: dish_name)
  within "#dish#{dish.id}" do
    click_button 'add'
  end
end

When(/^I click "([^"]*)"$/) do |button_name|
  click_button button_name
end

# Given(/^I visit the "([^"]*)" page$/) do |arg1|
#   pending # Write code here that turns the phrase above into concrete actions
# end

Then(/^I should be on the "([^"]*)" page$/) do |page_name|
  case page_name
  when 'index'
    path = '/'
  when 'login'
    path = '/auth/login'
  else
    raise "#{page_name} doesn't exist"
  end

  expect(page).to have_current_path path
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  pending # Write code here that turns the phrase above into concrete actions
end
