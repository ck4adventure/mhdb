Feature: An app has a User
  As a Collector
  I want to be able to track my own inventory
  So that I don't have to rely on the game info

  Scenario: User can sign up
    Given I am currently logged out
    And there is a 'Sign up' link in the header
    When I click the 'Sign up' link in the header
    Then I should be taken to the 'sign_up_form' form
    And it should have the content 'Sign up to start tracking your stuff'
    And it should have a form input for 'name'
    And it should have a form input for 'email'
    And it should have a button to 'Submit!'

  Scenario: User signs up with valid info
    Given I am viewing the 'sign_up_form' form
    And my name is 'Larry'
    And my email is 'test@test.com'
    When I fill in the form input for 'name'
    And I fill in the form input for 'email'
    And I click the 'Submit!' button
    Then my user info should be saved in the db
    And a session token is set in my browser
    And I should be redirected to the root page
    And I should see 'Welcome, Larry'

  Scenario: User signs up with a duplicate email
    Given I am viewing the 'sign_up_form' form
    And my name is 'Larry'
    And my email is 'test@test.com'
    And I already have an account
    When I fill in the field for 'name' with 'Larry'
    And I fill in the field for 'email' with 'test@test.com'
    And I click the 'Submit' button
    Then I should get an error message
    And it should say 'An account already belongs to that email'
    And it should say 'Try signing in instead'
    And it should have a link to 'Sign in'

  Scenario: User can sign in
    Given I am currently logged out
    When I click the 'Sign in' link in the header
    Then I should be taken to the 'sign_in_form' form
    And it should have the content 'Sign in to start tracking your stuff'
    And it should have a form input for 'email'
    And it should have a button to 'Submit!'

  Scenario: User signs in with valid info 
    Given I have an existing account
    And it has the name 'Larry'
    And it has the email 'test@test.com'
    And I am currently logged out
    And I am viewing the 'sign_in_form' form
    When I fill in the field for email with 'test@test.com'
    And I click the 'Sign In!' button
    Then I should be succesfully signed in
    And I should be redirected to the root page
    And I should see "Welcome, Larry"