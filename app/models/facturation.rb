class Facturation < ApplicationRecord
  # after_create :bill_send
  # after_create :admin_bill_send
  belongs_to :basket
  belongs_to :user

  validates :price,
    presence: true,
    numericality: { greater_than: 0 }

  def bill_send
    UserMailer.bill_email(self).deliver_now
  end
  def admin_bill_send
    AdminMailer.admin_bill_email(self).deliver_now
  end
end
