class Admin::ContactsController < Admin::ApplicationController
  def index
    @q = Contact.search(params[:q])
    @contacts = @q.result.paginate(page: params[:page], per_page: PER_PAGE)
  end

  private
    def contact
      @contact ||= params[:id] ? Contact.find(params[:id]) : Contact.new()
    end
    helper_method :contact
end
