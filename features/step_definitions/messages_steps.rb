When(/^I go to kiitos messages dashboard$/) do
  visit kiitos.messages_path
end

When /^I click on the first received kiito$/ do
  within '.list-group' do
    find('li:first').click
  end
end

Then(/^I should see "(.*?)"$/) do |text|
  within '#message-modal' do
    page.has_content?(text) == true
  end
end

Then(/^I should see the following kiitos:$/) do |table|
  visit kiitos.messages_path
  within '#messages-kiitos' do
    table.hashes.each do |value|
      assert page.has_content?(value['message-info']), 'Did not find kiito'
    end
  end
end