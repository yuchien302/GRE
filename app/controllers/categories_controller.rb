class CategoriesController < ApplicationController
  
  respond_to :json, :except => [:resetProgress]
  
  def index
    respond_with Category.all()
  end
  
  def show
    respond_with Category.find(params[:id])
  end
  
  def create
    respond_with Category.create(params[:category])
  end
  
  def update
    respond_with Category.update(params[:id], params[:category])
  end
  
  def destroy
    respond_with Category.destroy(params[:id])
  end

  def resetProgress
    c = Category.find(params[:category_id])
    c.words.each do |word|
      review = Review.create(state: "pending")
      word.reviews << review
    end
    # respond_with Word.find(1)
    render json: {:status => 'success'}
  end

end

