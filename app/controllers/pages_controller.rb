class PagesController < ApplicationController

  def home
    @technologies = Technology.order(:title)
    @max_hours = Technology.maximum(:hours).to_f
  end

end
