Feature: Register a customer
  In order to receive my order
  I need to register so that it’s easy to order again
  I want to be able to create an account
  In order to create a new account I need to fill in my contact info
  I want to see a confirmation message

Scenario: Register a new customer
  Given that I can see the menu page
  When I click "Register"
  Then I want to be redirected to the register customer page

Scenario: Fill in my contact information
  Given that I am on the registration page
  When I fill in "Username" with "John Doe"
  And I fill in "Password" with "Password"
  And I click "Submit"
  And I am Redirected to the main page
  Then I should see "Logged in as"
