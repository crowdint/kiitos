Given /^the host application has the following user:$/ do |user_info|
  user = user_info.hashes.first
  Kiitos.user_class.create email: user['email'], name: user['name']
end

Given /^there are no administrator users in the kiitos application$/ do
  Kiitos::Administrator.count.must_equal 0
end

Then /^I should become an administrator$/ do
  Kiitos.user_class.first.wont_be_nil
  Kiitos::Administrator.first.wont_be_nil
  Kiitos::Administrator.first.must_equal Kiitos.user_class.first
end
