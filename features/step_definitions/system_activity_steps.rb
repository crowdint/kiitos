When(/^I go to the system activity's page$/) do
  visit kiitos.messages_path
end

Then(/^I should see the following kiitos:$/) do |table|
  table.hashes.each do |value|
    assert page.has_content?(value['Message']), 'Did not find kiito'
  end
end

Then(/^I should not see the following kiitos:$/) do |table|
  table.hashes.each do |value|
    assert page.has_content?(value['Message']) == false, 'Did find kiito'
  end
end
