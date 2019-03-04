class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :welcome_send

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :baskets
  has_many :products, through: :baskets

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
