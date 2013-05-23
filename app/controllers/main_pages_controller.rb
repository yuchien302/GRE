class MainPagesController < ApplicationController

	def index
		@words = Word.all()
		@words = @words.sort { |x, y|
			wordx = x[:title].downcase
			wordy = y[:title].downcase
			if wordx[0] == "-"
				wordx = "zzzzz" + wordx
			end
			if wordy[0] == "-"
				wordy = "zzzzz" + wordy
			end
			if wordx == wordy
      	x[:title] <=> y[:title]
      else
				wordx <=> wordy
			end
		}

    respond_to do |format|
      format.html
    end
	end
	
	def wenyuchien
	end

end