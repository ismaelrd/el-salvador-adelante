class Event < ActiveRecord::Base
  ## validations
  validates :name, :description, :start_at, presence: true
end
