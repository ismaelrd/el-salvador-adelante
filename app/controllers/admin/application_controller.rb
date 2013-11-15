class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  PER_PAGE = 20

  layout "admin/application"

  respond_to :html, :js
end
