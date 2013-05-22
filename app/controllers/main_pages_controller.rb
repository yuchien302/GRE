class MainPagesController < ApplicationController

	def index
		@words = Word.all(:order => "title ASC")

    respond_to do |format|
      format.html
    end
	end
	
	def wenyuchien
	end

end