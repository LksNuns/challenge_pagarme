class AddReferencesAtRecipients < ActiveRecord::Migration
  def change
    add_reference :recipients, :bank_account, null: false
    remove_column :recipients, :active_bank_account
  end
end
