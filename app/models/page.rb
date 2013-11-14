class Page < ActiveRecord::Base

  ## ancestry
  has_ancestry cache_depth: true

  ## constants
  KIND = %w(page)

  ## validations
  validates :name, presence: true
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :kind, inclusion: { in: KIND }

end
