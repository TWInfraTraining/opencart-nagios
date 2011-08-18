Feature: opencart
  As a user
  I want to search for a product
  So that I can learn more about it

  Scenario: Visiting home page
    When I go to opencart
    Then I should see "iPod Classic"
    When I follow "iPod Classic"
    Then I should see "With 80GB or 160GB of storage and up to 40 hours of battery life"
