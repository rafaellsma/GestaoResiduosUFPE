include Warden::Test::Helpers

Given(/^Dont exist created users$/) do
  User.all.count.should == 0
end

When(/^I go to sign up page$/) do
  visit new_user_registration_path
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |field,email|
  fill_in "user_"+field, with: email
end

When(/^I fill "([^"]*)" with ([0-9]+)$/) do |field,num|
  fill_in "user_"+field, with: num
end

When(/^I submit form$/) do
  click_button 'Sign up'
end

Then(/^System has one user created$/) do
  User.all.count.should == 1
end
Then(/^User with email "([^"]*)", name "([^"]*)", phone_ext ([0-9]+), password "([^"]*)" and laboratory "([^"]*)" was created$/) do |email, name, phone_ext, password, laboratory|
  user = User.find_by_email(email)
  user.should_not be_nil
  user.name.should == name
  user.phone_ext.should == phone_ext.to_i
  user.valid_password?(password).should be true
  #falta implementar pegar o id do laboratorio
end

Then(/^User with email "([^"]*)" isnt approved$/) do |email|
  User.find_by_email(email).approved.should be false
end

Then(/^I can see a message "([^"]*)"$/) do |msg|
  page.should have_content msg
end
