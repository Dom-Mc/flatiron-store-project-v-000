# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  inventory   :integer
#  category_id :integer
#  title       :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :category

  def self.available_items
    self.where("inventory > 0")
  end

end
