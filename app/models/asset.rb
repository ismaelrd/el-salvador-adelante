class Asset < ActiveRecord::Base

  ## validations
  validates :name, presence: true

  ## associations
  belongs_to :assetable, polymorphic: true

end
