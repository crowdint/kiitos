When(/^I go to kiitos management panel$/) do
  visit kiitos.admin_kiitos_path
end

Then(/^I should be able to modify the "(.*?)" kiito with:$/) do |title, table|
  visit kiitos.admin_kiitos_path
  kiito = table.hashes.first
  page.find(:xpath, "//li[contains(., '#{title}')]/a[@class='edit-kiito']").click
  within '#edit-kiito' do
    fill_in 'Title', with: kiito[:title]
    select kiito[:category], from: 'Category'
    fill_in 'Description', with: kiito[:description]
    attach_file('Image', File.join(Rails.root, '../fixtures/images/category.png'))
    select kiito[:state], from: 'State'
    click_button 'Update Kiito'
  end
end

Then(/^I should enable\/disable following cards:$/) do |table|
  table.hashes.each do |value|
    visit kiitos.admin_kiitos_path
    page.find(:xpath, "//li[contains(., '#{value[:title]}')]/a[@class='edit-kiito']").click
    select value[:state], from: 'State'
    click_button 'Update Kiito'
  end
end

Then(/^I should be able to create the following valid kiitos:$/) do |table|
  table.hashes.each do |value|
    within '#form-new-kiito' do
      fill_in 'kiito_title', with: value[:title]
      select value[:category], from: 'kiito_kiitos_category_id'
      fill_in 'kiito_description', with: value[:description]
      attach_file('kiito_image', File.join(Rails.root, '../fixtures/images/category.png'))
      select value[:state], from: 'kiito_state'
      click_button 'Create'
    end
  end
end

Then(/^I should not be able to create the following invalid kiitos:$/) do |table|
  count = Kiitos::Kiito.count
  table.hashes.each do |value|
    Kiitos::Kiito.create(
      title: value[:title],
      kiitos_category_id: value[:category],
      description: value[:description],
      state: value[:state],
      image: value['image name']
    )
  end
  assert count == Kiitos::Kiito.count, 'Invalid kiitos were created'
end

Given(/^the following kiitos were sent:$/) do |table|
  visit kiitos.admin_kiitos_path
  table.hashes.each do |value|
    from = User.where(email: value['From Email']).first
    to = User.where(email: value['To Email']).first
    kiito = Kiitos::Kiito.where(title: value['Greeting Card Title']).first
    Kiitos::Message.create(
      from: from.id,
      to: to.id,
      kiitos_kiito: kiito,
      message: value[:Message],
      created_at: eval(value[:When?])
    )
  end
end
