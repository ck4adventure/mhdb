Feature: Every Hunter has a Rank
  Ranks are the backbone of Moushunt
  Each Hunter has a Rank
  A Rank unlocks Locations to Hunt, Items to Purchase and Craft, and Mice

  Scenario: View the Ranks
    Given there are a set number of Ranks
    When I view the Ranks page
    Then I should see all of the available Ranks
    And they should be in order
    And I should see a mark indicating my rank

  Scenario: User has a default Rank of Novice
    Given I am signing up as a new User
    When I submit the sign up form
    And I have not selected a Rank
    Then I should be given the default Rank of Novice

  Scenario: User can choose their Rank on Sign up
    Given I am signing up as a new User
    When I view then sign up form
    Then I should see a list of possible ranks
    And I should be able to select one
    And it should be listed on my Info Page

  Scenario: User can update their Rank
    Given I have attained a new Rank
    And I am viewing my User Info Page
    When I choose a new Rank from the Select Dropdown
    And I click the Submit button
    Then I should see my page refresh
    And I should see my new Rank listed
