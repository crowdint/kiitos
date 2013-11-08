When(/^I go to kiitos history dashboard$/) do
  visit kiitos.history_index_path
end

When /^I click on the first received kiito$/ do
  within '.list-group' do
    find('li:first').click
  end
end

Then(/^I should see "(.*?)"$/) do |text|
  visit kiitos.history_index_path
  within '#history-modal' do
    page.has_content?(text) == true
  end
end