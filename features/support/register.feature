Feature: Register a customer
  In order to receive my order
  I need to register so that it’s easy to order again
  I want to be able to create an account

Scenario: Register a new customer
  Given that I can see the menu page
  When I click the "Register" link
  Then I want to be "redirected" to the register customer page
