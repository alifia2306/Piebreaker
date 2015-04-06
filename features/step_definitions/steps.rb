Given(/^Im on the owner creation page$/) do 
  visit(new_owner_path)
end

When(/^I create a new owner$/) do
  fill_in 'Username', :with => "test"
  fill_in 'Restaurant name', :with => "Starbucks"
  fill_in 'Address', :with => "3300 walnut"
  fill_in 'Password', :with => "test"
  fill_in 'Category', :with => "Coffee Shop"
  fill_in 'Plan', :with => "basic"
  click_button 'Create Owner'
end

Then(/^I should be able to see the new owner's page$/) do
  assert page.has_content?("Owner was successfully created")
end

When(/^I create a new owner without entering a username$/) do
  fill_in 'Restaurant name', :with => "Starbucks"
  fill_in 'Address', :with => "3300 walnut"
  fill_in 'Password', :with => "test"
  fill_in 'Category', :with => "Coffee Shop"
  fill_in 'Plan', :with => "basic"
  click_button 'Create Owner'
end

Then(/^I should be able to see some error saying username is required$/) do
  assert page.has_content?("Username can't be blank")
end

When(/^I create a new owner without entering a password$/) do
  fill_in 'Username', :with => "test"
  fill_in 'Restaurant name', :with => "Starbucks"
  fill_in 'Address', :with => "3300 walnut"
  fill_in 'Category', :with => "Coffee Shop"
  fill_in 'Plan', :with => "basic"
  click_button 'Create Owner'
end

Then(/^I should be able to see some error saying password is required$/) do
  assert page.has_content?("Password can't be blank")
end

When(/^I create a new owner by entering a username that already exists$/) do
  fill_in 'Username', :with => "test"
  fill_in 'Restaurant name', :with => "Starbucks"
  fill_in 'Address', :with => "3300 walnut"
  fill_in 'Category', :with => "Coffee Shop"
  fill_in 'Plan', :with => "basic"
  click_button 'Create Owner'
  fill_in 'Username', :with => "test"
  fill_in 'Restaurant name', :with => "Starbucks"
  fill_in 'Address', :with => "3300 walnut"
  fill_in 'Category', :with => "Coffee Shop"
  fill_in 'Plan', :with => "basic"
  click_button 'Create Owner'
end

Then(/^I should be able to see some error saying username already exists$/) do
  assert page.has_css?('div.error_explanation')
end

Given(/^Im on the create a coupon page$/) do
  visit(new_coupon_path)
end

When(/^I create a new coupon$/) do
  fill_in 'Username', :with => "test"
  fill_in 'Content', :with => "Half Prices"
  click_button 'Create Coupon'
end

Then(/^I should be able to see the new coupon's details$/) do
  assert page.has_content?("Coupon was successfully created")
end

When(/^I create a new coupon without a username$/) do
  fill_in 'Content', :with => "Half Prices"
  click_button 'Create Coupon'
end

When(/^I create a new coupon without any content$/) do
  fill_in 'Username', :with => "test"
  click_button 'Create Coupon'
end

Then(/^I should be able to see some error saying content is required$/) do
  assert page.has_content?("Content can't be blank")
end
