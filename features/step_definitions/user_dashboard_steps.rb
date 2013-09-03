Then(/^I should have "(.*?)" kiitos$/) do |count|
  within('#received-kiitos') do
    page.assert_selector('li', count: count)
  end
end

Then(/^I should have the following ordered kiitos:$/) do |table|
  within '#received-kiitos' do
    page.assert_selector('li', count: 1)
    assert page.has_content?(table.hashes.first['Greeting Card Title'])
  end
end

When(/^I increase the search span to "(.*?)" months$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see my user's dashboard$/) do
  pending # express the regexp above with the code you wish you had
end
