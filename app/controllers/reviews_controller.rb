class ReviewsController < ApplicationController
  
  respond_to :json
  
  def index
    word = Word.find(params[:word_id])
    respond_with word.reviews.last()
  end
  
  def show
    respond_with Review.find(params[:id])
  end

  def create
  	word = Word.find(params[:word_id])
  	review = Review.create(params[:review])
  	word.reviews << review
    respond_with word, review
  end


end
