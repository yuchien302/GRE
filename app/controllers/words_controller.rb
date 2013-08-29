class WordsController < ApplicationController
  
  respond_to :json
  
  def index
    respond_with Word.all(:order => "updated_at ASC")


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
    respond_with Word.create(params[:word])
  end
  
  def update
    respond_with Word.update(params[:id], params[:word])
  end
  
  def destroy
    respond_with Word.destroy(params[:id])
  end


end
