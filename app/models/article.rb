class Article < ActiveRecord::Base
  ## paperclip
  has_attached_file :photo, styles: { normal: '640' }

  ## validations
  validates :name, :content, presence: true
  validates_attachment :photo,
    content_type: /^image\/(png|gif|jpeg|jpg)/

  ## associations
  belongs_to :user
end
