class ApplicationController < ActionController::Base
  include MenuConcern

  before_action :setup_menu

end
