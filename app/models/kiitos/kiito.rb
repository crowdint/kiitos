module Kiitos
  class Kiito < ActiveRecord::Base
    belongs_to :kiitos_category
    validates :title, :kiitos_category_id, :image, presence: true
  end
end
