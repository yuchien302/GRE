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
		$(".content-meaning").each ->
			$(this).html( GRE.prettyText( $(this).text() ) )
		$(".content-tips").each ->
			$(this).html( GRE.prettyText( $(this).text() ) )
		$(".content-sen").each ->
			$(this).html( GRE.prettyText( $(this).text() ) )
		$(".content-root").each ->
			$(this).html( GRE.prettyText( $(this).text() ) )
		$(".content-note").each ->
			$(this).html( GRE.prettyText( $(this).text() ) )

		$("#search-word").on "keyup", ->
			$(".word").show()		
			query = $('#search-word').val()
			pattern = new RegExp('^' + query)
			cpattern = new RegExp('@$')
			if cpattern.test( query )
				$('#search-word').val("")
			else
				pattern = new RegExp('^_' + query)
				$(".word").filter (index) ->
					!pattern.test( this.id )
				.hide()

		$("#search-word").on "focus", ->
			$(".word").show()		
			query = $('#search-word').val()
			pattern = new RegExp('^' + query)
			cpattern = new RegExp('@$')
			if cpattern.test( query )
				$('#search-word').val("")
			else
				pattern = new RegExp('^_' + query)
				$(".word").filter (index) ->
					!pattern.test( this.id )
				.hide()