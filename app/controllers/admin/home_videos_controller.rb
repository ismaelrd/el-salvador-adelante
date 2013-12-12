class Admin::HomeVideosController < Admin::ApplicationController
  def index
    @home_videos = HomeVideo.all
  end

  def create
    if home_video.save
      redirect_to edit_admin_home_video_path(home_video), notice: t('flash.home_videos.create.success') and return
    else
      render :new
    end
  end

  def update
    if home_video.update_attributes(home_video_params[:home_video])
      redirect_to admin_home_videos_path, notice: t('flash.home_videos.update.success') and return
    else
      render :edit
    end
  end

  def destroy
    home_video.destroy
    redirect_to admin_home_videos_path, alert: t('flash.home_videos.destroy.success') and return
  end

  private
    def home_video
      @home_video ||= params[:id] ? HomeVideo.find(params[:id]) : HomeVideo.new(home_video_params[:home_video])
    end
    helper_method :home_video

    def home_video_params
      params.permit(:id, home_video: [:url])
    end
end
