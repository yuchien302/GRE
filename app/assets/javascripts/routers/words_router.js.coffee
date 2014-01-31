class GRE.Routers.Words extends Backbone.Router
	routes:
		'backboneapp': 'backboneapp'
		'learning/:category': 'learningCategory'
		'learning/:category/': 'learningCategory'
		'learning/:category/:word': 'learningCategoryWord'
		'categories': 'categoryIndex'
		'categories/': 'categoryIndex'
		':category': 'category'

		
		'': 'backboneapp'

	initialize: ->
		console.log "[route] initialize"
		@categories = new GRE.Collections.Categories()
		@categories.fetch({async:false})
		# console.log @categories

	backboneapp: ->
		console.log "[route] backboneapp"

		@words = new GRE.Collections.Words()
		# @collection.fetch({async:false, reset: true})
		@words.fetch({async:false})
		indexView = new GRE.Views.WordsIndex(collection: @words)
		$('#desktop').html(indexView.render().el)

		# $('#desktop').show()
	category: (categoryTitle)->
		console.log "[route] category: " + categoryTitle
		@category = @categories.findWhere({title: categoryTitle})
		if(@category)

			@words = new GRE.Collections.Words(@category.id)

			@words.fetch({async:false})

			indexView = new GRE.Views.WordsIndex(collection: @words)
			$('#desktop').html(indexView.render().el)

	learningCategoryWord: (categoryTitle, word)->
		console.log "[route] learning category: " + categoryTitle + ", word: " + word
		@category = @categories.findWhere({title: categoryTitle})

		if(@category)
			@words = new GRE.Collections.Words(@category.id)
			@words.fetch({async:false})
			if(@words)
				idx = GRE.Helper.findIndexOfWordsByTitle(@words, word)

				if(idx==-1)
					GREroute.navigate("/learning/"+categoryTitle, {trigger: true})
				learningView = new GRE.Views.LearningIndex({collection: @words, category:@category , idx:idx})
				$('#desktop').html(learningView.render().el)




	learningCategory: (categoryTitle)->
		console.log "[route] learning category: " + categoryTitle

		@category = @categories.findWhere({title: categoryTitle})

		if(@category)
			@words = new GRE.Collections.Words(@category.id)
			@words.fetch({async:false})
			learningView = new GRE.Views.LearningIndex({collection: @words, category:@category, idx:0})
			$('#desktop').html(learningView.render().el)

	categoryIndex:  ->
		console.log "[route] categoryIndex"
		indexView = new GRE.Views.CategoriesIndex(collection: @categories)
		$('#desktop').html(indexView.render().el)

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