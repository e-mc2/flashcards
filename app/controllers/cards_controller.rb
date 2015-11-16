class CardsController < ApplicationController
  def index
  	@cards = Card.all
  end

  def create
  end
end
