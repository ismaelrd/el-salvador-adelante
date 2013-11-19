class Contact < ActiveRecord::Base
  ## validations
  validates :name, :email, :message, presence: true
  validates :name, :email, length: { maximum: 200 }
  validates :email, format: { with: /\A[^@]+@[^@]+\z/, message: I18n.t('validates.email_invalid') }

  ## callbacks
  after_create :deliver_contact_email

  ## methods
  def deliver_contact_email
    UserMailer.new_contact_message(self).deliver
  end
end
