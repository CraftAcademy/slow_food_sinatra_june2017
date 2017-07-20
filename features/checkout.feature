Feature: Placing an order
  As a customer
  I order to get some food from the restaurant
  I need to be able to place an order on the website

  Background:
    Given the following customers exist:
      | username | password |
      | johndoe  | password |

    Given the following categories exist
      | name         |
      | Starter      |
      | Main         |
      | Dessert      |

    And the following dishes exist
      | name                  | description          | price | category |
      | Burger Special        | A bacon cheeseburger | 75    | Main     |
      | Not so Special Burger | Meat Burger          | 25    | Main     |

  Scenario: A customer with an account needs to be able to checkout
    Given I log in using "johndoe" and "password"
    When I visit the "menu" page
    And I add "Burger Special" to the shopping cart
    Then I should see "Burger Special" in my cart
    When I click "Place order"
    Then I should see "Order was placed, you can pick it up in 30 minutes"
    And I should see "The total for your order is 75 kr"

  Scenario: A customer can order multiple items
    Given I log in using "johndoe" and "password"
    When I visit the "menu" page
    And I add "Burger Special" to the shopping cart
    Then I should see "Burger Special" in my cart
    When I add "Not so Special Burger" to the shopping cart
    Then I should see "Not so Special Burger" in my cart
    When I click "Place order"
    Then I should see "Order was placed, you can pick it up in 30 minutes"
    And I should see "The total for your order is 100 kr"

  Scenario: A customer trying to place an order when s/he not logged in
    Given I visit the "menu" page
    When I add "Burger Special" to the shopping cart
    Then I should see "Burger Special" in my cart
    When I click "Place order"
    Then I should be on the "login" page
    And I should see "You need to be logged in to place an order"
    When I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I click "Log In"
    Then I should be on the "index" page
    And I should see "Successfully logged in admin"
    When I click "Place order"
    Then I should see "Order was placed, you can pick it up in 30 minutes"
