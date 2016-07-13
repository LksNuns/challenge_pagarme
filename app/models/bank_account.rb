# == Schema Information
#
# Table name: bank_accounts
#
#  id              :integer          not null, primary key
#  id_bank_account :integer          not null
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bank_code       :string           not null
#  agencia         :string           not null
#  agencia_dv      :string           not null
#  conta           :string           not null
#  conta_dv        :string           not null
#  document_number :string           not null
#  legal_name      :string           not null
#

class BankAccount < ActiveRecord::Base
  belongs_to :user

  validates :id_bank_account, :bank_code, :agencia, presence: true
  validates :agencia_dv, :conta, :conta_dv, :document_number, :legal_name, presence: true

  # after_validation :send_to_pagarme
  #
  # protected
  #
  # def send_to_pagarme
  #   ba = PagarMe::BankAccount.new({
  #     :bank_code => self.bank_code,
  #     :agencia => self.agencia,
  #     :agencia_dv => self.agencia_dv,
  #     :conta => self.conta,
  #     :conta_dv => self.conta_dv,
  #     :legal_name => self.legal_name,
  #     :document_number => self.document_number
  #   }).create
  #   
  #   self.id_bank_account = ba.id
  #
  # end

end
