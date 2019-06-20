class PortfolioController < ApplicationController
  def index()
    @portfolio_items = Portfolio.includes(:technologies).all.order(:id)
  end
end
