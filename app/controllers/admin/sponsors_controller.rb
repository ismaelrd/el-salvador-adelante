class Admin::SponsorsController < Admin::ApplicationController
  def index
    @q = Sponsor.search(params[:q])
    @sponsors = @q.result.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def create
    if sponsor.save
      redirect_to edit_admin_sponsor_path(sponsor), notice: t('flash.sponsors.create.success') and return
    else
      render :new
    end
  end

  def update
    if sponsor.update_attributes(sponsor_params[:sponsor])
      redirect_to admin_sponsors_path, notice: t('flash.sponsors.update.success') and return
    else
      render :edit
    end
  end

  def destroy
    sponsor.destroy
    redirect_to admin_sponsors_path, alert: t('flash.sponsors.destroy.success') and return
  end

  private
    def sponsor
      @sponsor ||= params[:id] ? Sponsor.find(params[:id]) : Sponsor.new(sponsor_params[:sponsor])
    end
    helper_method :sponsor

    def sponsor_params
      params.permit(:id, sponsor: [ :active, :kind, :name, :alias, :amount, :description ])
    end
end
