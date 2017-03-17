Given(/^Exists ([0-9]+) unapproved users$/) do |qtd|
  center = Center.create(name: 'cin')
  dep = center.departments.create(name: 'dep')
  lab = dep.laboratories.create(name: 'lab1')

  qtd.to_i.times do |i|
    user = User.create(
      name: 'user'+i.to_s,
      email: "user#{i.to_s}@email.com",
      password: "user123",
      admin: false,
      approved: false,
      phone_ext: 123,
      laboratory: lab
    )
  end
end

Given(/^I am logged as admin$/) do
  admin = User.create(name: 'admin', email: "admin@admin.com", password: "admin123", admin: true, approved: true, phone_ext: 123)
  visit '/users/sign_in'
  fill_in "user_email", with: admin.email
  fill_in "user_password", with: 'admin123'
  click_button "Log in"
end

When(/^I am on users list page$/) do
  visit '/list'
end

When(/^I click in unapproved users list$/) do
  click_link 'usuarios nao aprovados'
end

Then(/^I see (\d+) users$/) do |qtd|
  expect(page.all('.users').count).to be qtd.to_i
end

Given(/^Exists (\d+) approved users$/) do |qtd|
  center = Center.create(name: 'cin')
  dep = center.departments.create(name: 'dep')
  lab = dep.laboratories.create(name: 'lab1')

  qtd.to_i.times do |i|
    user = User.create(
      name: 'user'+i.to_s,
      email: "user#{i.to_s}@email.com",
      password: "user123",
      admin: false,
      approved: true,
      phone_ext: 123,
      laboratory: lab
    )
  end
end

When(/^I click in approved users list$/) do
  click_link 'usuarios aprovados'
end

Then(/^I see "([^"]*)"$/) do |msg|
  expect(page).to have_content msg
end
