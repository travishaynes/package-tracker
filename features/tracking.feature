Feature: Tracking Feature
  
  Background:
    Given I am on the home page
  
  Scenario: Viewing the home page
    Then I should see "Where's My Package?"
    And I should see a field named "Tracking Number"
    And I should see a button named "Track It!"
  
  Scenario Outline: Tracking a package
    When I fill in "Tracking Number" with "<id>"
    And I press "Track It!"
    Then I should see "Details for package"
    And I should see "<id>"
  
  Examples:
    | id                  |
    | 183689015000001     |
    | 1Z12345E0291980793  |
    | EJ958083578US       |
