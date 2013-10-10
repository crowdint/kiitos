When(/^I sign in as "(.*?)"$/) do |user|
  u = User.where(email: user).first
  Kiitos::UserDashboardController.any_instance.stubs(:kiitos_current_user).returns(u)
  visit '/kiitos'
end

When /^I sign in on the kiitos application as "(.*?)"$/ do |email|
  visit '/kiitos'
end

Given /^I am signed in on the host application as "(.*?)"$/ do |email|
end
