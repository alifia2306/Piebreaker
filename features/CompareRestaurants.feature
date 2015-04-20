Feature: Compare restaurants

As a user
I should be able to compare restaurants shown in search results

	Scenario: Compare restaurants
		Given Im on the search results page
		When I select restaurants
		Then I should be able to see the comparision

	Scenario: Compare more than three restaurants 
		Given Im on the search results page
		When I select more than three restaurants
		Then I should be able to see some message saying maximum number of allowed comparisions is three

	Scenario: Compare restaurants without selecting any
		Given Im on the search results page
		When I try to compare without selecting any restaurants
		Then I should be able to see some message asking the user to select atleast one restaurant
