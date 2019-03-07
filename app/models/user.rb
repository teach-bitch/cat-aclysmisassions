class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend FriendlyId
  friendly_id :username, use: :slugged


  after_create :welcome_send


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :basket

  validates :first_name,
    presence: true,
    length: { in: 2..30 },
    :format => { :with => /\A[a-zA-Z-]+\z/,
    :message => "Seule les lettres et - sont autorisés & 2 caractères minimum" }

  validates :last_name,
    presence: true,
    length: { in: 2..30 },
    :format => { :with => /\A[a-zA-Z\-\s]+\z/,
    :message => "Seule les lettres et espaces sont autorisés & 2 caractères minimum" }

  validates :username,
    presence: true,
    length: { in: 2..15 },
    uniqueness: { message: "Nom d'utilisateur déjà pris" }


  validates :birthdate,
    presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
