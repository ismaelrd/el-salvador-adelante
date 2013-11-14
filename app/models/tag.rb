class Tag < ActiveRecord::Base

  ## validations
  validates :name, presence: true, length: { maximum: 200 }, uniqueness: true

end
