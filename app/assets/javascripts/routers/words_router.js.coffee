class GRE.Routers.Words extends Backbone.Router
	routes:
		'backboneapp': 'backboneapp'
		'backboneapp/#/new' : 'newWord'
		# '': 'index'
	initialize: ->
		@collection = new GRE.Collections.Words()
		# @collection.fetch({async:false, reset: true})
		@collection.fetch()
		indexView = new GRE.Views.WordsIndex(collection: @collection)
		$('#desktop').html(indexView.render().el)


	backboneapp: ->
		console.log "backboneapp"
		$('#desktop').show()

	newWord: ->
		console.log "new word"
		$('#desktop').hide()

	# index: ->
	# 	console.log "index"
	# 	$(".content-meaning").each ->
	# 		$(this).html( GRE.prettyText( $(this).text() ) )
	# 	$(".content-tips").each ->
	# 		$(this).html( GRE.prettyText( $(this).text() ) )
	# 	$(".content-sen").each ->
	# 		$(this).html( GRE.prettyText( $(this).text() ) )
	# 	$(".content-root").each ->
	# 		$(this).html( GRE.prettyText( $(this).text() ) )
	# 	$(".content-note").each ->
	# 		$(this).html( GRE.prettyText( $(this).text() ) )

	# 	$("#search-word").on "keyup", ->
	# 		location.hash = $('#search-word').val()

	# 	$("#search-word").on "focus", ->
	# 		location.hash = ""
	# 		location.hash = $('#search-word').val()