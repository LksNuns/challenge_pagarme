# == Schema Information
#
# Table name: bank_accounts
#
#  id              :integer          not null, primary key
#  id_bank_account :integer          not null
#  active          :boolean          not null
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class BankAccount < ActiveRecord::Base
  belongs_to :user

  validates :id_bank_account, :active, presence: true

end
