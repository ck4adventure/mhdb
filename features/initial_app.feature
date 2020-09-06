Feature: Initial App
  As a player of Mousehunt
  I want an app where I can view all available weapons
  And where I can view how much they cost and where to get them
  And where I can view how to make them
  So I can track which ones I have left to collect
  And I can easily know how to obtain them

  Scenario: 
    Given there is an app
    When I visit 'mhcollector.com'
    Then I should see "Mousehunt Collector"
    And the page title should be "MH Collector"