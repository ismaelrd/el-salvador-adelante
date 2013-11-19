class Admin::EventsController < Admin::ApplicationController
  def index
    @q = Event.search(params[:q])
    @events = @q.result.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def create
    if event.save
      redirect_to edit_admin_event_path(event), notice: t('flash.events.create.success') and return
    else
      render :new
    end
  end

  def update
    if event.update_attributes(event_params[:event])
      redirect_to admin_events_path, notice: t('flash.events.update.success') and return
    else
      render :edit
    end
  end

  def destroy
    event.destroy
    redirect_to admin_events_path, alert: t('flash.events.destroy.success') and return
  end

  private
    def event
      @event ||= params[:id] ? Event.find(params[:id]) : Event.new(event_params[:event])
    end
    helper_method :event

    def event_params
      params.permit(:id, event: [ :name, :description, :start_at ])
    end
end
