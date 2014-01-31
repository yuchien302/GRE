class GRE.Models.Word extends Backbone.Model
	initialize: ->
		if(@id)
			@reviews = new GRE.Collections.Reviews(@id)		
			@reviews.fetch()
# @reviews.bind("reset", this.updateCounts)

	validate: (attrs) ->
		if (attrs.word == "")
			return "單詞呢?詞呢!?"

	getLatestReviewState: =>
		@reviews.fetch({async: false})
		# console.log (@reviews.at(@reviews.size()-1)).get("state")
		# window.review = @reviews
		(@reviews.at(@reviews.size()-1)).get("state")