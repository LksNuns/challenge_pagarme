class AddFieldsToBankAccount < ActiveRecord::Migration
  def change
    change_table :bank_accounts do |t|
      t.string :bank_code, null:false
      t.string :agencia, null:false
      t.string :agencia_dv, null:false
      t.string :conta, null:false
      t.string :conta_dv, null:false
      t.string :document_number, null:false
      t.string :legal_name, null:false
      t.remove :active
    end
  end
end
