# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string
#  desc         :string
#  min_donation :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ActiveRecord::Base
  
  validates :name, :min_donation, presence: true
end
