class AddReferencesBankAccountsAndRecipient < ActiveRecord::Migration
  def change
    add_reference :bank_accounts, :recipient, null: false
  end
end
