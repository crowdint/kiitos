class AddAnonymousToMessages < ActiveRecord::Migration
  def change
    add_column :kiitos_messages, :anonymous, :boolean, default: false
  end
end
