class Asset::Document < Asset
  ## paperclip
  has_attached_file :attachment

  ## validations
  validates_attachment :attachment,
    content_type: { content_type:  ["application/pdf","application/vnd.ms-excel",
                    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                    "application/msword", 
                    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
                    "text/plain"]
                  }
end
