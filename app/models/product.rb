# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  desc       :string
#  price      :float
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :user

  validates :name, :price, presence: true
end
