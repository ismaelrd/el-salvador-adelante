class HomeVideo < ActiveRecord::Base

  ## constants
  YOUTUBE_REGEX = /(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?(\w{10,})/
  ##www.youtube.com/watch?v=3-NrJIfBxL0 # TODO this url is not valid with this regex

  ## validations
  validates :url, presence: true, format: { with: YOUTUBE_REGEX }

  ## methods
  def youtube_id
    regex = /^(?:http:\/\/)?(?:www\.)?\w*\.\w*\/(?:watch\?v=)?((?:p\/)?[\w\-]+)/
    url.match(regex)[1] rescue nil
  end
end
