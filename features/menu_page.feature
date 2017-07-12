Feature: As a Customer
In order to know what food to buy (and how much it costs)
I need to see a menu with a list of dishes (with prices)

Background:
  Given the following dishes exist
    | name                  | description          | price |
    | Burger Special        | A bacon cheeseburger | 75    |
    | Not so Special Burger | Meat Burger          | 25    |

Scenario: A customer sees a list of dishes on the menu page
  Given I visit the menu page
  Then I should see "Burger Special"
  And show me the page
