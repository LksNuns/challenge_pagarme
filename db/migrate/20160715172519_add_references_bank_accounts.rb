class AddReferencesBankAccounts < ActiveRecord::Migration
  def change
    add_reference :bank_accounts, :user
  end
end
