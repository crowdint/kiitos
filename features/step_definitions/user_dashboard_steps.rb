Then(/^I should have "(.*?)" kiitos$/) do |count|
  within('#received-kiitos') do
    page.assert_selector('li', count: count)
  end
end

Then(/^I should have the following ordered kiitos:$/) do |table|
  count = table.hashes.length
  within '#received-kiitos' do
    page.assert_selector('li', count: count)
    table.hashes.each do |kiito|
      assert page.has_content?(kiito['Greeting Card Title'])
    end
  end
end

When(/^I increase the search span to "(.*?)" months$/) do |arg1|
  click_button '2 months'
end

Then(/^I should see my user's dashboard$/) do
  pending # express the regexp above with the code you wish you had
end
