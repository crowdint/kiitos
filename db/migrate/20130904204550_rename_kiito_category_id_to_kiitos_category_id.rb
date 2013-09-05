class RenameKiitoCategoryIdToKiitosCategoryId < ActiveRecord::Migration
  def change
    rename_column :kiitos_kiitos, :kiito_category_id, :kiitos_category_id
  end
end
