When(/^I go to the users management panel$/) do
  visit kiitos.admin_users_path
end

Then(/^I should be able to see the host application users pool$/) do
  users = User.all
  assert page.has_content?(users.first.email), 'The user is not present'
  assert page.has_content?(users.last.email), 'The user is not present'
end

Then(/^I should be able to promote a user to admin$/) do
  pending
end

Then(/^I should be able to degrade a user from admin$/) do
  pending
end
