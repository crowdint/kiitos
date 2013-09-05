Given(/^I am an administrator "(.*?)"$/) do |email|
  user = User.create email: email, name: 'admin'
  Kiitos::Administrator.create user_id: user.id
end

When(/^I go to the users management panel$/) do
  visit kiitos.admin_users_path
end

Then(/^I should be able to see the host application users pool$/) do
  users = User.all
  assert page.has_content?(users.first.email), 'The user is not present'
  assert page.has_content?(users.last.email), 'The user is not present'
end

Then(/^I should be able to promote a user to admin$/) do
  user = User.last
  assert Kiitos::Administrator.last.user_id != user.id, 'User is already an admin'
  assert page.has_content?('Promote to Admin'), "Cannot find the 'Promote to Admin' link"
  click_link 'Promote to Admin'
  assert Kiitos::Administrator.last.user_id.must_equal(user.id), 'User is already an admin'
end

Then(/^I should be able to degrade a user from admin$/) do
  assert Kiitos::Administrator.count.must_equal(2), "There are no Administrators"
  assert page.has_content?('Demote from Admin'), "Cannot find the 'Demote from Admin' link"
  first('li').click_link 'Demote from Admin'
  assert Kiitos::Administrator.count.must_equal(1), "Administrator wasn't removed"
end
