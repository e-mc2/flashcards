class CardsController < ApplicationController
  before_action :find_card, only: [:show, :update, :destroy, :edit]

  def index
    @cards = Card.all.order("review_date ASC")
  end

  def show
    
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(cards_params)

    if @card.save
      redirect_to cards_path, notice: "Successfully created new card"
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @card.update(cards_params)
      redirect_to cards_path
    else
      render 'edit'
    end  
  end

  def destroy
    @card.destroy
    redirect_to cards_url, notice: "Successfully delete card"
  end

  private

  def cards_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end

  def find_card
    @card = Card.find(params[:id])
  end

end
