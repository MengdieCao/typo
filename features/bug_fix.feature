Feature: To fix the bug in Categories
    As the admin of the blog
    
    Background:
        Given the blog is set up
        And I am logged into the admin panel

    Scenario: Create new category
        Given I am on the new category page 
        Then I should see "General" 
        
        # Check if new category can be created
        When I fill in "category_name" with "Category1"
        And I fill in "category_keywords" with "Keyword1"
        And I fill in "category_permalink" with "Permalink1"
        And I fill in "category_description" with "Description1"
        And I press "Save"
        Then I should see "Category1"
        Then I should see "Keyword1"
        Then I should see "Permalink1"
        Then I should see "Description1"
        When I follow "Edit"
        Then I should see "Category1"
        Then I should see "Keyword1"
        Then I should see "Permalink1"
        Then I should see "Description1"
        
    Scenario: Edit existing category
        Given I am on the new category page
        When I follow "Edit"
        And I fill in "category_name" with "Category2"
        And I fill in "category_keywords" with "Keyword2"
        And I fill in "category_permalink" with "Permalink2"
        And I fill in "category_description" with "Description2"
        And I press "Save"
        # Should not see the old data for this category
        Then I should not see "Category1"  
        Then I should not see "Keyword1"
        Then I should not see "Permalink1"
        Then I should not see "Description1"
        # Should see the updated data for this category
        Then I should see "Category2"
        Then I should see "Keyword2"
        Then I should see "Permalink2"
        Then I should see "Description2"
        
        

        