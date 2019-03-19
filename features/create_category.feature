Feature: Manage Categories
  As a blog administrator
  I want to be able to manage categories of my blog
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel 
    
  Scenario: Allow admin to save a new category
    And I am on the categories page
    When I fill in the following :
    | Name        | Movie                                                        |
    | Keywords    | comedy, action, romance, thriller, animation, sci-fi         |
    | Description | This categorie includes articles that are related to movies. |
    And I press "Save"
    Then I should be on the categories page
    And I should see "This categorie includes articles that are related to movies."
    And I should see "comedy, action, romance, thriller, animation, sci-fi" 
    
   Scenario: Allow admin to edit an existing category
    Given that Movie categories are added
    And I am on the categories page
    When I follow "Movie"
    Then the "category_name" field should contain "Movie"
    When I fill in the following:
      | Keywords | G, PG, PG-13, NC-17, R |
    And I press "Save"
    Then I should be on the categories page
    And I should see "G, PG, PG-13, NC-17, R "