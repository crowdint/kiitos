When(/^I go to the users management panel$/) do
  visit kiitos.admin_users_path
end

Then(/^I should be able to see the host application users pool$/) do
  User.create email: 'user1@test.com'
  User.create email: 'user2@test.com'
  users = User.all
  page.has_content? users.first.email
  page.has_content? users.last.email
end

Then(/^I should be able to promote a user to admin$/) do
  pending
end

Then(/^I should be able to degrade a user from admin$/) do
  pending
end
