class Category < ActiveRecord::Base
  ## paperclip
  has_attached_file :photo, styles: { small: '200', normal: '640' }

  # validations
  validates :name, presence: true, length: { maximum: 200 }
  validates_attachment :photo,
    content_type: { content_type: /^image\/(png|gif|jpeg|jpg)/ }
end
