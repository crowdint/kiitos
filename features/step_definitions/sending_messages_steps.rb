When(/^I fill in the send kiito form with:$/) do |table|
  value = table.hashes.first
  within '#send-kiito' do
    binding.pry
    select value[:to], from: 'message_to'
    select value[:kiito], from: 'message_kiitos_kiito_id'
    fill_in 'Message', with: value[:message]
    click_button 'Send Kiito'
  end
end
