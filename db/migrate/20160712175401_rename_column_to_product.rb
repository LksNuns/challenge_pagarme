class RenameColumnToProduct < ActiveRecord::Migration
  def change
    rename_column :products, :price, :min_donation
  end
end
