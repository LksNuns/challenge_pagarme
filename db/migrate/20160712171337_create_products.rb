class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :desc
      t.float :price, null: false
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
