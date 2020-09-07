Feature: An app has a User
  As a Collector
  I want to be able to track my own inventory
  So that I don't have to rely on the game info

  Scenario: User can sign up
    Given I am currently logged out
    And there is a 'Sign up' button in the header
    When I click the 'Sign Up' button in the header
    Then I should be taken to the sign up form
    And it should have the content 'Sign Up to start tracking your stuff'
    And it should have a form input for 'name'
    And it should have a form input for 'email'
    And it should have a submit button

  Scenario: User signs up with valid info
    Given I am viewing the 'Sign up' form
    And my name is 'Larry'
    And my email is 'test@test.com'
    When I fill in the field for 'name'
    And I fill in the field for 'email'
    And I click 'Submit'
    Then my user info should be saved in the db
    And a session token is set in my browser
    And I should be redirected to the root page
    And I should see 'Welcome, Larry'

  Scenario: User signs up with a duplicate email
    Given I am viewing the 'Sign up' form
    And my name is 'Larry'
    And my email is 'test@test.com'
    And I already have an account
    When I fill in the field for 'name' with 'Larry'
    And I fill in the field for 'email' with 'test@test.com'
    And I click the 'Submit' button
    Then I should get an error message
    And it should say that I already have an account
    And it should say 'Try signing in instead'
    And it should have a link to 'Sign in'

  Scenario: User can sign in
    Given I am currently logged out
    When I click the 'Sign in' button in the header
    Then I should be taken to the 'Sign in' form
    And it should have the content 'Sign in to start tracking your stuff'
    And it should have a form input for 'email'
    And it should have a submit button

  Scenario: User signs in with valid info 
    Given I have an existing account
    And it has the name 'Larry'
    And it has the email 'test@test.com'
    And I am currently logged out
    And I am viewing the 'Sign in' form
    When I fill in the field for email with 'test@test.com'
    And I click the 'Submit' button
    Then I should be succesfully signed in
    And I should be redirected to the root page
    And I should see "Welcome, 'Larry'"