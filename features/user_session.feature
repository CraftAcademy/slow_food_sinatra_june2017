Feature: User can log in
  As a User
  In order to access the system
  I want to be authenticated by submitting my credentials

  Background:
    Given that there are no users in the system
    And the following users exist
      | username | password    |
      | admin    | password    |
      | thomas   | my_password |

  Scenario: User provides the right combination of user name and password
    When I am on the landing page
    And I click "Log In"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "password"
    And I click "Sign In"
    Then I should see "Logged in as admin"
    And I should see "Successfully logged in admin"


  Scenario: User inputs the wrong password
    When I am on the landing page
    And I click "Log In"
    Given I fill in "Username" with "admin"
    And I fill in "Password" with "wrong-password"
    And I click "Sign In"
    Then I should see "The username and password combination"
