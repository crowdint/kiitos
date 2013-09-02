class CreateKiitosKiitos < ActiveRecord::Migration
  def change
    create_table :kiitos_kiitos do |t|
      t.string :title
      t.belongs_to :kiito_category, index: true
      t.string :description
      t.string :state
      t.string :image

      t.timestamps
    end
  end
end
