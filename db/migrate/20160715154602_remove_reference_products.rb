class RemoveReferenceProducts < ActiveRecord::Migration
  def change
    remove_reference(:bank_accounts, :user)
  end
end
