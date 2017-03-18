Given(/^I'm logged as admin$/) do
  email = 'admin@admin.com'
  password = 'admin123'

  user = User.create(name: "admin", email: "admin@admin.com", password: "admin123", admin: true, approved: true, phone_ext: 1, laboratory_id: 1).save!
  
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end

Given(/^there are (\d+) sediments in the system from "([^"]*)" registred in "([^"]*)"$/) do |amount, local, reg_date|
  conv_date = reg_date.to_date
  (amount.to_i).times do |i|
   	  Sediment.create(composition: "Teste #{i}", weight: 10, local: local, data_created: conv_date, data_registered: conv_date).save!  	
  end
end

When(/^I go to the Report's Page$/) do
  visit 'report'
end

When(/^I fill the initial date with "([^"]*)"$/) do |initial_date|
  conv_date = initial_date.to_date
  fill_in "initial_date", with: conv_date
end

When(/^I fill the final date with "([^"]*)"$/) do |final_date|
  conv_date = final_date.to_date
  fill_in "final_date", with: conv_date
end

When(/^I click the "([^"]*)" button$/) do |btn|
  click_button btn
end

Then(/^I got an report with (\d+) sediments$/) do |amount|
  expect(page).to have_css("#seg_lenght", text: amount)
end