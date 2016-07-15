class AddReferencesToRecipient < ActiveRecord::Migration
  def change
    add_reference :recipients, :user
  end
end
