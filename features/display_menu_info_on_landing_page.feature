Feature: View menu on landing page
  As a visitor
  In order to to be able to choose something to order
  I would like to see what menus are available

  Background:
    Given the following menus exist
      | name    | description          |
      | Lunch   | Our tasty lunch menu |
      | Evening | Our A La Carte menu  |


  Scenario: Display available menus
    Given I am on the landing page
    Then I should see "Lunch"
    And show me the page
