When(/^I fill in the send kiito form with:$/) do |table|
  value = table.hashes.first
  within '#send-kiito' do
    unless value[:to] == 'All'
      find('.users-list .choose-secondary').click
      fill_in 'search_to', with: value[:to]
      # we are using this line to avoid poltergeist breaks
      page.execute_script("$('.tt-dropdown-menu').show()")
      find(:xpath, "//div[@class='tt-suggestion']/p[text()='#{value[:to]}']").click
    end
    find('.kiitos-list .choose').click
    find(:xpath, "//label[text()='#{value[:kiito]}']").click
    fill_in 'message_message', with: value[:message]
    click_button 'Post it'
  end
end

Then(/^The user "(.*?)" should have "(.*?)" kiito in his received messages$/) do |user, kiito|
  step "I sign in as \"#{user}\""
  within '#received-kiitos' do
    page.has_css?('ul.list-group li', count: kiito)
  end
end

Then(/^I should not see the user "(.*?)"$/) do |user|
  within '#send-kiito' do
    assert page.has_content?(user) == false, 'The user was found'
  end
end
