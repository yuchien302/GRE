class GRE.Views.Miniblock extends Backbone.View

	template: JST['words/miniblock']


	initialize: ->
		@model.on('reset', @render, this)
		@model.reviews.on('add', @changeState, this)
		

	render: ->
		$(@el).html(@template({model: @model}))
		this

	changeState: =>
		# TODO: handle no reviews
		rlength = @model.reviews.length
		state = @model.reviews.at(rlength-1).get("state")
		
		$(@el).html(@template({model: @model}))

		$(@el).removeClass()
		$(@el).addClass(state)
	
		

		


		




