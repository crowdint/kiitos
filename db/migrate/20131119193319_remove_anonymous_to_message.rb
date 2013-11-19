class RemoveAnonymousToMessage < ActiveRecord::Migration
  def change
    remove_column :kiitos_messages, :anonymous
  end
end
