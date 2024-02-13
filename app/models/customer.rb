# frozen_string_literal: true

# :nodoc
class Customer < ApplicationRecord
  include CustomerCache
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
  
  validates :email, presence: true

  def create_refresh_cache_job
    CustomerRefreshCacheJob.perform_now(id)
  end
end
