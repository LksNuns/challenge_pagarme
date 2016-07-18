class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :id_transaction, null: false
      t.integer :amount
      t.belongs_to :product, null: false
      t.timestamps null: false
    end
  end
end
