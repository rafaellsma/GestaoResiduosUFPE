include Warden::Test::Helpers

Given(/^Dont exist created users$/) do
  expect(User.all.count).to eq(0)
end

Given(/^The Center "([^"]*)" exists$/) do |center_name|
  Center.create(name: center_name)
end

Given(/^The Department "([^"]*)" at center "([^"]*)" exists$/) do |dept_name, center_name|
  center = Center.find_by_name(center_name)
  center.departments.create(name: dept_name)
end

Given(/^The laboratory "([^"]*)" at department "([^"]*)" exists$/) do |lab_name, dept_name|
  department = Department.find_by_name(dept_name)
  department.laboratories.create(name: lab_name)
end

When(/^I go to sign up page$/) do
  visit new_user_registration_path
end

When(/^I select option "([^"]*)" in "([^"]*)"$/) do |option, sel|
  find("##{sel}_select").find("option[#{option}]").click
end

When(/^I submit form$/) do
  click_button 'Sign up'
end

Then(/^User with email "([^"]*)", name "([^"]*)", phone_ext ([0-9]+), password "([^"]*)" and laboratory "([^"]*)" was created$/) do |email, name, phone_ext, password, laboratory|
  user = User.find_by_email(email)
  expect(user).not_to be nil
  expect(user.name).to eq name
  expect(user.phone_ext).to eq phone_ext.to_i
  expect(user.valid_password?(password)).to eq true
  expect(user.laboratory.id).to eq laboratory.to_i
end

Then(/^User with email "([^"]*)" isnt approved$/) do |email|
  expect(User.find_by_email(email).approved).to be false
end

Then(/^I can see a message "([^"]*)"$/) do |msg|
  expect(page).to have_content msg
end

Given(/^Doesnt exist any notifications$/) do
  expect(Notification.count).to eq 0
end

Then(/^User with email "([^"]*)" isnt admin$/) do |email|
  expect(User.find_by_email(email).admin).to be false
end

Then(/^Exists (\d+) notifications$/) do |qtd|
  expect(Notification.count).to eq qtd.to_i
end

Given(/^Exists one admin$/) do
  user = User.create(name: 'admin', email: "admin@admin.com", password: "admin123", admin: true, approved: true, phone_ext: 1)
end

Then(/^System has (\d+) user created$/) do |qtd|
    expect(User.all.count).to  eq(qtd.to_i)
end


When(/^I go to register admin page$/) do
  visit register_admin_path
end

And(/^I go to login page$/) do
  visit new_user_session_path
end


And(/^I make login$/) do
  click_button 'Log in'
end

And(/^I submit new admin user form$/) do
  click_button 'Criar Usuario'
end