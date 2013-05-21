class GRE.Routers.Words extends Backbone.Router
	routes:
		'desktop': 'index'

	index: ->
		@collection = new GRE.Collections.Words()
		@collection.fetch({async:false, reset: true})
		# @collection.sort()
		indexView = new GRE.Views.WordsIndex(collection: @collection)
		$('#desktop').html(indexView.render().el)
