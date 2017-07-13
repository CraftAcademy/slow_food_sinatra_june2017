Feature: Register a customer
  In order to receive my order
  I need to register so that it’s easy to order again
  I want to be able to create an account

Scenario: Register a new customer
  Given that I can see the menu page
  And that I can see the "Register" button
  When I click the "Register" button
  Then I want to be "redirected" to the register customer page
