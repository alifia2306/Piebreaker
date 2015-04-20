Feature: Search for restaurants

As a user
I should be able to search for restaurants

	Scenario: Search for restaurant
		Given Im on the search page
		When I search for restaurants
		Then I should be able to see the search results

	Scenario: Search for restaurants leaving location blank
		Given Im on the search page
		When I search for restaurants leaving location blank
		Then I should be able to see some message saying location gives better results