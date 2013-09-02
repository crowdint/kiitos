class CreateKiitosCategories < ActiveRecord::Migration
  def change
    create_table :kiitos_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
