class Sponsor < ActiveRecord::Base
  ## constants
  KIND = %w(anonymous public)

  ## validations
  validates :alias, :name, :document_type, :document, length: { maximum: 200 }
  validates :name, :document, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 5 }
  validates :kind, inclusion: { in: KIND }

end
