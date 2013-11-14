class Asset::Picture < Asset
  ## paperclip
  has_attached_file :attachment, styles: { small: "200", normal: "640" }

  ## validations
  validates_attachment :attachment,
    content_type: { content_type: /^image\/(png|gif|jpeg|jpg)/ }
end
