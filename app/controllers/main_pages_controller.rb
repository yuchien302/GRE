class MainPagesController < ApplicationController

	def mobile
		@words = Word.all(:order => "title ASC")

    respond_to do |format|
      format.html # index.html.erb
    end
	end
	
	def desktop
	end

end