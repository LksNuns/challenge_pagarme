# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  desc         :string
#  min_donation :float            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#

class Product < ActiveRecord::Base
  belongs_to :user

  validates :name, :min_donation, presence: true
end
