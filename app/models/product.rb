# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string
#  desc         :string
#  min_donation :float
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :user

  validates :name, :min_donation, presence: true
end
