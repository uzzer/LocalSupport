Feature: Admin approve charity admin
  As an Admin
  So that I can approve someone to be able to make edits for a particular charity
    (assumed charity admin has requested access to become charity admin and email has been sent)
  I want to be able to verify the organisation/user and give them access to their charity.

  Background:
    Given the following organizations exist:
    | name            | address        |
    | My Organization | 83 pinner road |

    And the following users are registered:
    | email              | password       | admin | confirmed_at        | organization    | charity_admin_pending | pending_organization_id | 
    | nonadmin@myorg.com | mypassword1234 | false | 2008-01-01 00:00:00 |                 | false                 | 	|
    | admin@myorg.com    | adminpass0987  | true  | 2008-01-01 00:00:00 | My Organization | false                 |   |
    | pending@myorg.com  | password123    | false | 2008-01-01 00:00:00 |                 | true                  | 1 |

  And I am signed in as an admin
  And I am on the users page

  Scenario: As an admin on users page
    Given there are pending users
    And show me the page
    When I approve a user
    Then I see the user as a charity admin
    And show me the page

  # NEW SCENARIO
    # user was approved by admin
        # user.can_edit must be TRUE (which means they are charity admin for that org)
        # user.charity_admin_pending will be FALSE (changed from true)
        # user.organization is still set for their charity
    # behavior-wise user should be able to see Edit button on their org
    # user should not be able to see Edit button on other organizations
  # Scenario: I am now a charity admin
    # Given I am approved as a charity admin
    # (port something like this to the admin_approve_user.feature for the background step?)
    # And I am on the charity page for "My Organization"
    # Then I should see an edit button for "My Organization" charity
    # When I am on the charity page for "Another organization"
    # Then I should not see an edit button for "Another organization" charity
