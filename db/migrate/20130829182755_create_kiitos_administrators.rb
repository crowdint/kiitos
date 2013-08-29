class CreateKiitosAdministrators < ActiveRecord::Migration
  def change
    create_table :kiitos_administrators do |t|
      t.integer :user_id
      t.index :user_id
    end

  end
end
