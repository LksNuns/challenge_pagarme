class RemoveReferencesBankAccounts < ActiveRecord::Migration
  def change
    remove_reference(:bank_accounts, :recipient)
  end
end
