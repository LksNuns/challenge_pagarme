# == Schema Information
#
# Table name: transactions
#
#  id             :integer          not null, primary key
#  id_transaction :integer          not null
#  amount         :integer
#  product_id     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Transaction < ActiveRecord::Base
  belongs_to :product


end
