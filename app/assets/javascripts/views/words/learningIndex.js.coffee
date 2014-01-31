class GRE.Views.LearningIndex extends Backbone.View

	template: JST['words/learningIndex']


	initialize: (params) ->

		@collection = params.collection
		@current = params.idx
		@category = params.category
		@categoryTitle = @category.get("title")
		@forgotOnly = @category.get("state") == "reviewForgot"
		@collection.on('reset', @render, this)
		@collection.on('add', @render, this)
		
	
	checkReviewOption: =>
		if(@current == @collection.size())
			return
		if(@forgotOnly)
			while(@collection.at(@current).getLatestReviewState()!="forgot")
				@current = @current+1
				if(@current == @collection.size())
					break

	render: ->
		console.log "[learningIndex] render"
		$(@el).html(@template())
		@collection.each(@appendMinimap)
		currentWord = @collection.at(@current)
		if(@forgotOnly && currentWord.getLatestReviewState()!="forgot")
			@next()
			return this

		@currentView = new GRE.Views.LearningShow(model: currentWord)
		@currentView.on("next", @next)
		@$("#main-learning-region").html(@currentView.render().el)
		window.history.pushState(null, null, "/learning/"+ @categoryTitle + "/" + currentWord.get("title"))
		
		@$(".flip-container").addClass("present")
		this

	next: =>
		# TODO: add length constraint
		console.log "[learningIndex] next"
		@current = @current+1
		@checkReviewOption()

		if(@current == @collection.size())
			@finishView = new GRE.Views.LearningFinish({model: @category})
			@finishView.on("reviewForgot", @reviewForgot)
			@finishView.on("reviewAll", @reviewAll)
			window.history.pushState(null, null, "/learning/"+ @categoryTitle)

			@$("#main-learning-region").prepend(@finishView.render().el)
		else
			@previousView = @currentView
			if(@previousView)
				setTimeout =>
					@previousView.close()
				, 3000		

			@currentView = new GRE.Views.LearningShow(model: @collection.at(@current))
			@currentView.on("next", @next)
			# GREroute.navigate("learning/"+ @categoryTitle + "/" + @collection.at(@current).get("title"), {trigger: false})
			window.history.pushState(null, null, "/learning/"+ @categoryTitle + "/" + @collection.at(@current).get("title"))
			@$("#main-learning-region").prepend(@currentView.render().el)
			
			setTimeout =>
				@$(".flip-container").addClass("present")
			, 100
		

		
	reviewForgot: =>
		console.log "[learningIndex] reviewForgot"
		@forgotOnly = true
		@category.save {state : "reviewForgot"}, {
			success: ->
				window.location.reload() # after reload @forgotonly disappear
			, error: ->
				alert "error!"
			}
		# window.location.reload() # after reload @forgotonly disappear
	reviewAll: =>
		console.log "[learningIndex] reviewAll"
		@forgotOnly = false
		@category.save {state : "reviewAll"}, {
			success: ->
				window.location.reload() # after reload @forgotonly disappear
			, error: ->
				alert "error!"
			}
	appendMinimap: (word) =>
		view = new GRE.Views.Miniblock(model: word)
		@$("#minimap-region").append(view.render().el)
		




