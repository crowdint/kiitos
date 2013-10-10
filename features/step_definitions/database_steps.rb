Given(/^the following categories are predefined:$/) do |table|
  table.hashes.each do |value|
    Kiitos::Category.create(name: value['category name'])
  end
end

Given(/^the following users exist:$/) do |table|
  table.hashes.each do |value|
    User.create name: value['name'], email: value['User Email']
  end
end

Given(/^an administrator user exists$/) do
  Kiitos::Administrator.create user_id: 1
end

Given(/^the following kiitos exist:$/) do |table|
  table.hashes.each do |value|
    Kiitos::Kiito.create(
      title: value[:title],
      kiitos_category_id: value[:category],
      description: value[:description],
      state: value[:state],
      image: value[:image]
    )
  end
end

Given /^the host application has the following user:$/ do |table|
  table.hashes.each do |user_info|
    Kiitos.user_class.create email: user_info['email'], name: user_info['name']
  end
end

Given /^there are no administrator users in the kiitos application$/ do
  Kiitos::Administrator.count.must_equal 0
end

Then /^the user "(.*?)" should become an administrator$/ do |email|
  Kiitos.user_class.first.wont_be_nil
  Kiitos::Administrator.first.wont_be_nil
  user = Kiitos.user_class.where(email: email).first
  Kiitos::Administrator.where(user_id: user.id).wont_be_nil
end

Then /^the user "(.*?)" should not become an administrator$/ do |email|
  user = Kiitos.user_class.where(email: email).first
  Kiitos::Administrator.where(user_id: user.id).first.must_be_nil
end

Given /^The user "(.*?)" is an administrator in the kiitos application$/ do |email|
  user = Kiitos.user_class.where(email: email).first
  Kiitos::Administrator.create user_id: user.id
end

Then /^land in the administrator panel$/ do
  page.current_path.must_equal '/kiitos/admin'
end

Then /^I should land in my user's dashboard$/ do
  page.current_path.must_equal '/kiitos/dashboard'
end
