When(/^I fill in the send kiito form with:$/) do |table|
  value = table.hashes.first
  within '#send-kiito' do
    select value[:to], from: 'message_to'
    select value[:kiito], from: 'message_kiitos_kiito_id'
    fill_in 'Message', with: value[:message]
    click_button 'Send Kiito'
  end
end

Then(/^The user "(.*?)" should have the "(.*?)" kiito in his received messages$/) do |user, kiito|
  step "I sign in as \"#{user}\""
  within '#received-kiitos' do
    assert page.has_content?(kiito), 'The kiito is not there'
  end
end