class RemoveReferenceBankAccounts < ActiveRecord::Migration
  def change
    remove_reference(:products, :user)
  end
end
