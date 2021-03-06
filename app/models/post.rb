class Post < ActiveRecord::Base
  ## paperclip
  has_attached_file :photo, styles: { small: '200', normal: '640' }

  ## validations
  validates :name, :content, presence: true
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_attachment :photo,
    content_type: { content_type: /^image\/(png|gif|jpeg|jpg)/ }

  ## associations
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :pictures, -> { order(priority: :asc) }, as: :assetable, class_name: Asset::Picture, dependent: :destroy
  has_many :videos, -> { order(priority: :asc) }, as: :assetable, class_name: Asset::Video, dependent: :destroy
  has_many :documents, -> { order(priority: :asc) }, as: :assetable, class_name: Asset::Document, dependent: :destroy

  ## nested attributes
  accepts_nested_attributes_for :pictures, :videos, :documents, allow_destroy: true, reject_if: :all_blank
end
