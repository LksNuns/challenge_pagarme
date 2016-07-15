class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :id_recipient, index: true, null: false
      t.integer :active_bank_account, null:false
    end
  end
end
