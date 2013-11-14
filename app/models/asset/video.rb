class Asset::Video < Asset
  ## activestore
  store :data, accessors: [ :url ], coder: JSON

  ## constants
  YOUTUBE_REGEX = /(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?(\w{10,})/

  ## validations
  validates :url, presence: true, format: { with: YOUTUBE_REGEX }

  ## methods
  def youtube_id
    regex = /^(?:http:\/\/)?(?:www\.)?\w*\.\w*\/(?:watch\?v=)?((?:p\/)?[\w\-]+)/
    url.match(regex)[1] rescue nil
  end

  def youtube_thumb(size = :small)
    if size == :small
      return "http://img.youtube.com/vi/#{youtube_id}/default.jpg"
    else
      return "http://img.youtube.com/vi/#{youtube_id}/hqdefault.jpg"
    end
  end
end
