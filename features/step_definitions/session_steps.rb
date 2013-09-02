When(/^I sign in as "(.*?)"$/) do |arg1|
  ApplicationController.stub :current_user, arg1 do
    assert true, 'iwano'
  end
end

When /^I sign in on the kiitos application as "(.*?)"$/ do |email|
  visit '/kiitos'
end
