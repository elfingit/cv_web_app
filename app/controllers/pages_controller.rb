class PagesController < ApplicationController

  before_action :set_page, only: [:show]

  def home
    @technologies = Technology.order(:title)
    @max_hours = Technology.maximum(:hours).to_f
  end

  def show
  end

  private
  def set_page
    @page = Page.friendly.find(params[:id])
  end

end
