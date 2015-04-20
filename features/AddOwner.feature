Feature: Add New Owner

	As a user
	so that I can track my owners
	I want to add a new owner to the list	

	Scenario: Add an owner
		Given Im on the owner creation page
		When I create a new owner
		Then I should be able to see the new owner's page

	Scenario: Add an owner without username
		Given Im on the owner creation page
		When I create a new owner without entering a username
		Then I should be able to see some error saying username is required

	Scenario: Add an owner without password
		Given Im on the owner creation page
		When I create a new owner without entering a password
		Then I should be able to see some error saying password is required