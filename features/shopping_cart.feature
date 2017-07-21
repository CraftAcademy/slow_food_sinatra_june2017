Feature: As a Customer
  In order to buy food
  I need to add dishes to my order

Background:
  Given the following categories exist
  | name         |
  | Starter      |
  | Main         |
  | Dessert      |

And the following dishes exist
  | name                  | description          | price | category   |
  | Burger Special        | A bacon cheeseburger | 75    | Main       |
  | Not so Special Burger | Meat Burger          | 25    | Main       |

Scenario: A customer is able to add dishes to their cart
  Given I visit the menu page
  And I click on the "add" button
  Then I should see the "Burger Special" in my cart

Scenario: A customer is able to add two dishes to their cart by pressing the same add twice
  Given I visit the menu page
  And I click on the "add" button
  Then I should see "Burger Special 1" in my cart
  And I click on the "add" button
  Then I should see "Burger Special 2" in my cart
