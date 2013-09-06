require 'test_helper'

describe Kiitos::Kiito do
  before do
    @subject = Kiitos::Kiito.new(
      title:  'Title',
      kiitos_category_id: 1,
      description: 'Description',
      image: 'image'
    )
  end

  it 'is invalid without a title' do
    @subject.title = nil
    @subject.valid?.must_equal false
  end

  it 'is invalid without a category' do
    @subject.kiitos_category_id = nil
    @subject.valid?.must_equal false
  end

  it 'is invalid without an image name' do
    @subject.image = nil
    @subject.valid?.must_equal false
  end
end
