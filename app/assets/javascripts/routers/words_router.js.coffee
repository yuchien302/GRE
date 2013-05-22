class GRE.Routers.Words extends Backbone.Router
	routes:
		'wenyuchien': 'wenyuchien'
		'': 'index'

	wenyuchien: ->
		console.log "wenyuchien"
		@collection = new GRE.Collections.Words()
		@collection.fetch({async:false, reset: true})
		indexView = new GRE.Views.WordsIndex(collection: @collection)
		$('#desktop').html(indexView.render().el)

	index: ->
		console.log "index"
