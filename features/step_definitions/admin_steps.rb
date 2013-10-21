When /^I click on "(.*?)"$/  do |arg1|
  within '#admin-menu' do
    page.find('#admin-option').click
  end
end

Then /^I should see the admin dashboard$/  do
  assert page.has_css?('#admin-options', 'Could not find CSS #admin-options')
end

Then /^I should not see a link to the admin dashboard$/  do
  refute page.has_css?('#admin-options', 'Found CSS #admin-options')
end
