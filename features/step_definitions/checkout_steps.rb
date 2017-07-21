When(/^I add "([^"]*)" to the shopping cart$/) do |dish_name|
  dish = Dish.first(name: dish_name)
  within "#dish#{dish.id}" do
    click_button 'add'
  end
end
