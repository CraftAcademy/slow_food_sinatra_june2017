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
      | name                  | description          | price | category |
      | Burger Special        | A bacon cheeseburger | 75    | Main     |
      | Not so Special Burger | Meat Burger          | 25    | Main     |

  Scenario: A customer is able to add dishes to their cart
    Given I visit the menu page
    And I click on the "add" button
    Then I should see the "Burger Special" in my cart

  Scenario: A customer is able to add two dishes to their cart by pressing the same add twice
    Given I visit the menu page
    And I click on the "add" button
    Then I should see the "Shopping Cart" in my cart
    And I click on the "add" button
    Then I should see "2" in element "quantity"

  Scenario: A customer is able to view the total in their shopping cart
    Given I visit the menu page
    And I click on the "add" button
    And I click on the "add" button
    Then I should see the "Total: 150" in my cart
