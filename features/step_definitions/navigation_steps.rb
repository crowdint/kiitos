Then(/^I should end up in the kiitos management panel$/) do
  assert current_url == kiitos.admin_kiitos_url, 'Not in the kiitos management panel'
end

When(/^I click on the cancel button$/) do
  click_link 'Cancel'
end
