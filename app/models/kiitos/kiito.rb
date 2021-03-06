module Kiitos
  class Kiito < ActiveRecord::Base
    belongs_to :kiitos_category, class_name: '::Kiitos::Category'
    validates :title, :kiitos_category_id, :image, presence: true

    mount_uploader :image, Kiitos::KiitoAvatarUploader
  end
end
