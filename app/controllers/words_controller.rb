class WordsController < ApplicationController
  
  respond_to :json
  
  def index
    # @words=[]
    if(params[:category_id])
      c = Category.find(params[:category_id])
      respond_with c.words
    else
      respond_with Word.all(:order => "updated_at ASC")
    end
    


    # @words = Word.all()
    # @words = @words.sort { |x, y|
    #   wordx = x[:title].downcase
    #   wordy = y[:title].downcase
      
    #   if wordx[0] == "-"
    #     wordx = "zzzzz" + wordx
    #   end
      
    #   if wordy[0] == "-"
    #     wordy = "zzzzz" + wordy
    #   end
      
    #   if wordx == wordy
    #     x[:title] <=> y[:title]
    #   else
    #     wordx <=> wordy
    #   end
    # }

    # respond_with @words
  end
  
  def show
    respond_with Word.find(params[:id])
  end
  
  def create
    @word = Word.create(params[:word])
    if(params[:category_id])
      c = Category.find(params[:category_id])
      c.words << @word 
    end
    respond_with @word 
  end
  
  def update
    respond_with Word.update(params[:id], params[:word])
  end
  
  def destroy
    respond_with Word.destroy(params[:id])
  end


end
