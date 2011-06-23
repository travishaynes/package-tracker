Feature: Tracking Feature
  
  Background:
    Given I am on the home page
  
  Scenario: Viewing the home page
    Then I should see "Where's My Package?"
    And I should see a field named "Tracking Number"
    And I should see a button named "Track It!"
  
  Scenario: Tracking a package with an invalid package id
    When I fill in "Tracking Number" with "invalid id"
    And I press "Track It!"
    Then I should see "Cannot find a service to track package"
  
  Scenario: Tracking a valid package id for package that does not exist
    When I fill in "Tracking Number" with "183689015000002"
    And I press "Track It!"
    Then the page should have a div with the id "flash_alert"
    And I should see "No information for the following shipments"
  
  Scenario Outline: Tracking a valid package id with an existing package
    When I fill in "Tracking Number" with "<id>"
    And I press "Track It!"
    Then I should see "Details for package"
    And I should see "<id>"
  
    Examples:
      | id                  |
      | 183689015000001     |
      | 1Z12345E0291980793  |
      | EJ958083578US       |

