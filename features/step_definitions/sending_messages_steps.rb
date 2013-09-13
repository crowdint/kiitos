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

When(/^I fill in the send kiito form anonymously with:$/) do |table|
  value = table.hashes.first
  within '#send-kiito' do
    select value[:to], from: 'message_to'
    select value[:kiito], from: 'message_kiitos_kiito_id'
    fill_in 'Message', with: value[:message]
    check 'Send Anonymously'
    click_button 'Send Kiito'
  end
end

Then(/^The user "(.*?)" should not see the sender name "(.*?)" for the "(.*?)" kiito$/) do |user, from, kiito|
  step "I sign in as \"#{user}\""
  within '#received-kiitos' do
    assert page.has_content?(from) == false, 'The kiito is not anonymous'
  end
end

Then(/^I should not see the user "(.*?)"$/) do |user|
  within '#send-kiito' do
    assert page.has_content?(user) == false, 'The user was found'
  end
end

Then(/^All the users should receive the kiito$/) do
  user = Kiitos.user_class.where(email: 'user2@test.com').first
  user2 = Kiitos.user_class.where(email: 'user3@test.com').first
  assert user.received_messages.count == 1, 'The user did not receive the kiito'
  assert user2.received_messages.count == 1, 'The user did not receive the kiito'
end
