class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :set_paper_trail_whodunnit
  def current_user
    @current_user ||= User.first
  end
end
