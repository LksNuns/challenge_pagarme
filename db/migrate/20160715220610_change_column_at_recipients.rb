class ChangeColumnAtRecipients < ActiveRecord::Migration
  def change
    change_column :recipients, :id_recipient, :string, unique: true
  end
end
