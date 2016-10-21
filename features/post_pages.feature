Feature: Pposts
  Scenario: guest user see footer
	Given I am a guest user
	When I go to the index page
	Then I must see footer

  Scenario: guset user sees posts
	Given I am a guest user
	And there are posts
	When I go to the post page
	Then I must see posts conten