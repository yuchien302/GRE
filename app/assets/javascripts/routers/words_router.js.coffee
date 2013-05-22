class GRE.Routers.Words extends Backbone.Router
	routes:
		'raphael': 'raphael'
		'': 'index'

	raphael: ->
		console.log "raphael"
		@collection = new GRE.Collections.Words()
		@collection.fetch({async:false, reset: true})
		indexView = new GRE.Views.WordsIndex(collection: @collection)
		$('#desktop').html(indexView.render().el)

	index: ->
		console.log "index"
