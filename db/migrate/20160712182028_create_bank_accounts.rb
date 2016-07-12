class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :id_bank_account, null: false
      t.boolean :active, null: false
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
