class CreateKiitosMessages < ActiveRecord::Migration
  def change
    create_table :kiitos_messages do |t|
      t.integer :to
      t.integer :from
      t.belongs_to :kiitos_kiito, index: true
      t.string :message

      t.timestamps
    end
  end
end
