Feature: Log in a user
  As a user of the system
  In order to be able to access restricted features
  I want to be able to create an account


Scenario: Register an account
  Given I am on the landing page
  When I click "Register"
  And I fill in "Username" with "Thomas"
  And I fill in "Password" with "my-password"
  And I click "Create account"
  Then I should see "Successfully created account for Thomas"
