class Category < ActiveRecord::Base
  # validations
  validates :name, presence: true, length: { maximum: 200 }
end
