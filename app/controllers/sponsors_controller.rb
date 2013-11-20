class SponsorsController < ApplicationController

  def index
    set_meta_tags title: 'Apoyanos, mira quienes ya nos están ayudando', site: 'El Salvador Adelante', reverse: true
  end

  def create
    if contact.save
      redirect_to sponsors_path, notice: 'Su mensaje ha sido envíado, pronto nos contactaremos con usted.' and return
    else
      render :index
    end
  end

  private
    def contact
      @contact ||= Contact.new(contact_params[:contact])
    end
    helper_method :contact

    def contact_params
      params.permit(contact: [ :name, :email, :phone, :message ])
    end

    def sponsors
      @sponsors ||= Sponsor.active.order(:priority, :created_at)
    end
    helper_method :sponsors
end
