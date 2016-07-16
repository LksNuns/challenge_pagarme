# == Schema Information
#
# Table name: recipients
#
#  id                  :integer          not null, primary key
#  id_recipient        :string           not null
#  active_bank_account :integer          not null
#  user_id             :integer
#
# Indexes
#
#  index_recipients_on_id_recipient  (id_recipient)
#

class Recipient < ActiveRecord::Base
  attr_accessor :transfer_interval, :transfer_day, :bank_account_id

  belongs_to :user
  has_many :products

  before_validation :send_to_pagarme

  def send_to_pagarme

    begin
      recipient = PagarMe::Recipient.new(bank_account_id: self.bank_account_id, transfer_day: self.transfer_day.to_i,
        transfer_interval: self.transfer_interval, transfer_enabled: true)
      recipient.create
      self.id_recipient = recipient.id
      self.active_bank_account = 3
    rescue Exception => e
      self.errors.add(:base, "Dados Inválido")
    end
  end

end
