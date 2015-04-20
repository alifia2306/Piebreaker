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

Given(/^Im on the search page$/) do
  visit(users_path)
end

When(/^I search for restaurants$/) do
  fill_in 'location', :with => "PA"
  fill_in 'search', :with => "Starbucks"
  click_button 'Search'
end

Then(/^I should be able to see the search results$/) do
  assert page.has_content?("Search Results")
end

When(/^I search for restaurants leaving location blank$/) do
  fill_in 'search', :with => "Coffee"
  click_button 'Search'
end

Then(/^I should be able to see some message saying location gives better results$/) do
  assert page.has_content?("*Specifying a Location gives better results")
end

Given(/^Im on the search results page$/) do
  visit(users_path)
  fill_in 'location', :with => "PA"
  fill_in 'search', :with => "Coffee"
  click_button 'Search'
end

When(/^I select restaurants$/) do
  visit(users_path)
  fill_in 'location', :with => "PA"
  fill_in 'search', :with => "Coffee"
  click_button 'Search'
  # p page.text
  #click_button 'submit'
  # visit(show_results_path)
  # # select("PA",:from=>location)
  # find(:div, "id[value='29']").set(true)
  # find(:div, "id[value='301']").set(true)
  # find(:div, "id[value='286']").set(true)
  # find('first-column', :visible => false).click
  # Capybara.ignore_hidden_elements = false
  # page.find(:xpath , '//*[@id="ids_"]').set(true)
  # find(:xpath, '//*[@id="ids_"]')

  # page.check("td.first_column.ids_.table-row-checkbox[value='286']")
  # select(1, :from => ids[1])
  # select(2, :from => ids[2])29 286 301
  # select(3, :from => ids[3])
  # all('input[type=checkbox]')[0..2].each do |c|
  #   c.set(true)
  # check('input#ids_.table-row-checkbox')
  # assert page.has_content?('Delivery')
  
  # page.find(:css, "ids_.table-row-checkbox[value='286']").set(true)
  #find(:css, "input#ids_.table-row-checkbox[value='286']").set(true)
  # end
  # click_button 'submit'
  # page.has_content('comparison results')
end

# Then(/^I should be able to see the comparision$/) do
#   assert page.has_content?("Comparison Results")
# end

# When(/^I select more than three restaurants$/) do
  
# end

# Then(/^I should be able to see some message saying maximum number of allowed comparisions is three$/) do
#   # assert page.has_content?("Please select atmost three restaurants to compare")
# end

When(/^I try to compare without selecting any restaurants$/) do
  visit(users_path)
  fill_in 'location', :with => "PA"
  fill_in 'search', :with => "Coffee"
  click_button 'Search'
end

Then(/^I should be able to see some message asking the user to select atleast two restaurants$/) do
  assert page.has_content?("Please select atleast one restaurant to compare")
end

