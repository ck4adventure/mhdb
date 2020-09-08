Feature: User has a session
  As a User
  I want the system to remember me
  So that I don't have to remember my password

Scenario: User can sign in
    Given I am currently logged out
    When I click the 'Sign in' link in the header
    Then I should be taken to the Sign in form
    And it should have the content 'Sign in to start tracking your stuff'
    And it should have a form input for 'email'
    And it should have a button to 'Sign in!'

  Scenario: User signs in with valid info 
    Given I have an existing account
    And it has the name 'Larry'
    And it has the email 'test@test.com'
    And I am currently logged out
    And I am viewing the Sign in form
    When I fill in the field for email with 'test@test.com'
    And I click the 'Sign In!' button
    Then I should be succesfully signed in
    And I should be redirected to the root page
    And I should see "Welcome, Larry"