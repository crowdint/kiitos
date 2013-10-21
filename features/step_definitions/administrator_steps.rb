Given(/^I am an administrator "(.*?)"$/) do |email|
  user = User.create email: email, name: 'admin'
  Kiitos::Administrator.create user_id: user.id
end

When(/^I go to the users management panel$/) do
  visit kiitos.user_dashboard_path
  find('#admin-option').click
  find('.add-user').click
end

Then(/^I should be able to see the host application users pool$/) do
  users = Kiitos::Administrator.all
  within '.manage-admins' do
    users.each do |user|
      page.has_content?(user.user.name).must_equal true
    end
  end
end

Then(/^I should be able to promote a user to admin$/) do
  user = User.last
  Kiitos::Administrator.last.user_id.wont_equal user.id
  click_button 'Promote to Admin'
  Kiitos::Administrator.last.user_id.must_equal user.id
end

Then(/^I should be able to degrade a user from admin$/) do
  admin = Kiitos::Administrator.first
  admins_before = Kiitos::Administrator.count
  find("#delete_admin_#{admin.id}").click
  wait_for_ajax
  Kiitos::Administrator.count.must_equal admins_before - 1
end
