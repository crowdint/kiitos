Then(/^I should have "(.*?)" kiitos$/) do |count|
  within('.list-group') do
    page.assert_selector('li', count: count)
  end
end

Then(/^I should have the following ordered kiitos:$/) do |table|
  count = table.hashes.length
  within '.list-group' do
    page.assert_selector('li', count: count)
    table.hashes.each do |kiito|
      assert page.has_content?(kiito['Greeting Card Title'])
    end
  end
end

When(/^I increase the search span to "(.*?)"$/) do |search_span|
  click_button "#{search_span}"
end
