# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  name               :string           not null
#  current_cart_id    :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable,
  # :recoverable, :rememberable, :trackable,

  devise :database_authenticatable, :registerable, :validatable

  has_many :carts
  belongs_to :current_cart, class_name: "Cart"

  def current_cart_create
    new_cart = carts.create
    self.current_cart_id = new_cart.id
    save
  end

  def current_cart_destroy
    self.current_cart_id =  nil
    save
  end

end
