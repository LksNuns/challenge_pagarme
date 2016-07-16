# == Schema Information
#
# Table name: recipients
#
#  id              :integer          not null, primary key
#  id_recipient    :string           not null
#  user_id         :integer
#  bank_account_id :integer          not null
#
# Indexes
#
#  index_recipients_on_id_recipient  (id_recipient)
#

class Recipient < ActiveRecord::Base
  attr_accessor :transfer_interval, :transfer_day

  belongs_to :user
  belongs_to :bank_account
  has_many :products

  before_validation :send_to_pagarme

  def send_to_pagarme
    begin
      ba_id = BankAccount.find(self.bank_account_id).id_bank_account
      recipient = PagarMe::Recipient.new(bank_account_id: ba_id, transfer_day: self.transfer_day.to_i,
        transfer_interval: self.transfer_interval, transfer_enabled: true)
      recipient.create
      self.id_recipient = recipient.id
    rescue Exception => e
      self.errors.add(:base, "Dados Inválido")
    end
  end
end
