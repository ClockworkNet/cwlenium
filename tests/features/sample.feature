Feature: As a visitor, view Clockwork.com

Scenario: Open Clockwork.com
	Given a web browser
	When I navigate to clockwork.com
	Then I see the title "Home - Clockwork"

