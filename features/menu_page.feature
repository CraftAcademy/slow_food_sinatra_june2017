Feature: As a Customer
In order to know what food to buy (and how much it costs)
I need to see a menu with a list of dishes (with prices)

Background:
  Given the following dishes exist
    | name                  | description          | price | categoryId |
    | Burger Special        | A bacon cheeseburger | 75    | 2          |
    | Not so Special Burger | Meat Burger          | 25    | 2          |
  And the following categories exist
    | name         |
    | Starter      |
    | Main         |
    | Dessert      |

Scenario: A customer sees a list of dishes divided into categories
  Given I visit the menu page
  Then I should see "Main"
  And show me the page

Scenario: A customer sees a list of dishes on the menu page
  Given I visit the menu page
  Then I should see "Burger Special"
  And show me the page
