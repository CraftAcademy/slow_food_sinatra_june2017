Feature: As a Restaurant
In order to make the right food
I need to see the orders that customers have placed

Background:
  Given the following categories exist
  | name         |
  | Starter      |
  | Main         |
  | Dessert      |

  And the following dishes exist
  | name                  | description          | price | category |
  | Burger Special        | A bacon cheeseburger | 75    | Main     |
  | Not so Special Burger | Meat Burger          | 25    | Main     |

Scenario: A customer needs to be able to checkout
  Given I visit the menu page
  And I log in using "admin" and "admin"
  And I click on the "add" button
  And I click on the "add" button
  And I click on the "checkout" button
  Then I should see "Order was placed"
