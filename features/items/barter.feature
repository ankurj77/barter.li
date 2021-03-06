Feature: Barter Items
  As a user
  I can barter my items with others
  I can give my books for free

    Scenario: User barter items without login
      When I am not logged in
      Given I am in items page
      When I click barter button
      Then I am asked to login
      And I type some message
      And click submit
      Then the item owner should get a notification about it
      
    Scenario: User barter items when login
      When I am logged in
      Given I am in items page
      When I click barter button
      Then I am redirected to barter page
      And I type some message
      And click submit
      Then the item owner should get a notification about it
    
    Scenario: User barter notifications
      Given seeing notifications alert
      When I click on it
      Then I should see users interested in bartering my item
      And I can see users item
      Then I can post a reply to him
      And I can select locations with foresquare with time
      Then interested user should get a Notification of it

    Scenario: User can give books for free
       When I list books for free
       Then other users can ask for it 
       And I can decide on them


    Scenario: Barter History
       Given I am on items page
       Then I can see the history of barter items


    Scenario: After Accepting Request for Bartering
       Given I bartered the item
       When I checked this with application
       Then the bartered item disapears from my list
       And the received item appears on my list with status reading
       Then I can change the status for bartering
       And It appears on my barter page








            
      