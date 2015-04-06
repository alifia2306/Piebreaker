Feature: Add New Coupon

As a owner
I should be able to add new coupons to my account

	Scenario: Add a coupon
		Given Im on the create a coupon page
		When I create a new coupon
		Then I should be able to see the new coupon's details

	Scenario: Add a coupon without a username
		Given Im on the create a coupon page
		When I create a new coupon without a username
		Then I should be able to see some error saying username is required

	Scenario: Add a coupon that already exists
		Given Im on the create a coupon page
		When I create a new coupon that already exists
		Then I should be able to see some error saying coupon already exists