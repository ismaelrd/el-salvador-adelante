class Page < ActiveRecord::Base
  ## ancestry
  has_ancestry cache_depth: true

  ## constants
  KIND = %w(page)

  ## validations
  validates :name, presence: true
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :kind, inclusion: { in: KIND }

  ## associations
  has_many :pictures, as: :assetable, class_name: Asset::Picture, dependent: :destroy
  has_many :videos, as: :assetable, class_name: Asset::Video, dependent: :destroy
  has_many :documents, as: :assetable, class_name: Asset::Document, dependent: :destroy

  ## nested attributes
  accepts_nested_attributes_for :pictures, :videos, :documents, allow_destroy: true, reject_if: :all_blank
end
