# == Schema Information
#
# Table name: recipients
#
#  id                  :integer          not null, primary key
#  id_recipient        :integer          not null
#  active_bank_account :integer          not null
#  user_id             :integer
#
# Indexes
#
#  index_recipients_on_id_recipient  (id_recipient)
#

class Recipient < ActiveRecord::Base
  belongs_to :user
  has_many :products
  has_many :bank_accouts

end