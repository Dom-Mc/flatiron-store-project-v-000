# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null


class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items


  def add_item(item_id)
    if line_item = line_items.find_by(item_id: item_id)
      line_item.quantity += 1
      line_item
    else
      # NOTE: adds item_id to self.line_items (doesn't save it)
      line_item = line_items.build(item_id: item_id)
    end
  end

  def complete_checkout
    self.status = "submitted"
    update_inventory
    user.current_cart_destroy
  end

  def total
    line_items.inject(0) do |sum, line_item|
      sum + (line_item.item.price * line_item.quantity)
    end
  end

  private

    def update_inventory
      line_items.each do |line_item|
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
    end

end
