class ChangeReferenceOfProducts < ActiveRecord::Migration
  def change
    remove_reference :products, :recipient
    add_reference :products, :user, null: false
  end
end
