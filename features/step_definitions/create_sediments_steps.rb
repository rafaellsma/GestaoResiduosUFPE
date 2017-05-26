Given(/^I'm not logged in$/) do
  visit destroy_user_session_path
end

When(/^I go to create sediments page$/) do
  visit new_sediment_path
end

Then(/^I see a message "([^"]*)"$/) do |msg|
  expect(page).to have_content msg
end

Given(/^I'm logged in as user$/) do
  user = User.create(name: 'test', email:'test@test.com', password:'123456', phone_ext:'123', approved: true)
  center = Center.create(name: 'cin')
  center.departments << Department.create(name: 'cin')
  center.departments.first.laboratories << Laboratory.create(name: 'lab 1')
  lab = center.departments.first.laboratories.first
  user.laboratory = lab
  visit new_user_session_path
  fill_in "user_email", with: 'test@test.com'
  fill_in "user_password", with: '123456'
  click_button "Entrar"
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |field, txt|
  fill_in field, with: txt
end

When(/^I fill "([^"]*)" with (\d+)$/) do |field, num|
  fill_in field, with: num
end

When(/^I select "([^"]*)" with "([^"]*)" option$/) do |field, option|
  find("##{field}").find(:xpath, "option[#{option}]").select_option
end

When(/^I click "([^"]*)"$/) do |msg|
  click_button msg
  p Sediment.all
end

Then(/^I can see message "([^"]*)"$/) do |msg|
  expect(page).to have_content msg
end
