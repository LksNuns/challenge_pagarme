class AddReferencesProductsAndRecipient < ActiveRecord::Migration
  def change
    add_reference :products, :recipient, null: false
  end
end
