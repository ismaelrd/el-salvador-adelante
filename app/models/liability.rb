class Liability < ActiveRecord::Base
  ## paperclip
  has_attached_file :photo, styles: { small: '200', normal: '664' }

  ## validations
  validates :name, :content, :category_id, presence: true
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_attachment :photo,
    content_type: { content_type: /^image\/(png|gif|jpeg|jpg)/ }

  ## associations
  belongs_to :category
  has_many :pictures, as: :assetable, class_name: Asset::Picture, dependent: :destroy
  has_many :videos, as: :assetable, class_name: Asset::Video, dependent: :destroy
  has_many :documents, as: :assetable, class_name: Asset::Document, dependent: :destroy

  ## nested attributes
  accepts_nested_attributes_for :pictures, :videos, :documents, allow_destroy: true, reject_if: :all_blank
end
