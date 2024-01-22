class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable
  belongs_to :city
  belongs_to :state
  belongs_to :country
  belongs_to :business
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy 
end
