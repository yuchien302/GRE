class GRE.Views.WordsIndex extends Backbone.View

	template: JST['words/index']

	events: ->
		"click #submit_word": 'submitWord'
		"click #new_word": 'newWord'
		"click #submit_category": 'submitCategory'

		# "keyup #search-word": 'searchWord'
		# "focus #search-word": 'focusSearchWord'

	initialize: ->
		@collection.on('reset', @render, this)
		@collection.on('add', @render, this)
		@collection.on('change:title', @render, this)
		

	render: ->
		$(@el).html(@template())
 

		@collection.each(@appendWord)
		this

	appendWord: (word) =>
		if word.get('title') == ""
			return
		view = new GRE.Views.WordShow(model: word)
		@$("#wordlist").prepend(view.render().el)
		# title = word.get('title')
		# $wordview = @$("#" + title)
		# title = title.substr(0, title.length-1)
		# while ( ( title!="" && @$("#"+title).length == 0 ) )
		# 	$wordview.before("<div id=\"" + title + "\" class='word-anchor' ></div>")
		# 	title = title.substr(0, title.length-1)



	newWord: (e) ->
		Backbone.submitType = "New"

		$('#word_title').val("")
		$('#word_meaning').val("")
		$('#word_tips').val("")
		$('#word_sen').val("")
		$('#word_root').val("")
		$('#word_note').val("")


	submitWord: (e) ->
		self = this
		# e.preventDefault()
		attributes = 
			title: $('#word_title').val()
			meaning: $('#word_meaning').val()
			sen: $('#word_sen').val()
			tips: $('#word_tips').val()
			root: $('#word_root').val()
			note: $('#word_note').val()
		$('#word_modal').modal('hide')

		setTimeout ->
			if(Backbone.submitType == "New")
				self.collection.create attributes,
					wait:true
					success: (word) ->
						console.log "create success!"
						# location.hash = word.get('title')
					error: (word, msg) ->
						alert "error: " + msg

			else if(Backbone.submitType == "Edit")
				wid = $('#word_modal').attr('data-wid')
				self.collection.get(wid).save attributes, 
					wait: true
					success: (word) ->
						console.log "update success!"
						# location.hash = word.get('title')
					error: (word, msg) ->
						alert "error: " + msg
		, 100

		
		

	searchWord: ->
		# location.hash = $('#search-word').val()
		# $(".word").show()
		
	focusSearchWord: ->
		# location.hash = ""
		# location.hash = $('#search-word').val()
		# query = 
		# pattern = new RegExp('^' + query)
		# cpattern = new RegExp('@$')
		# if cpattern.test( query )
		# 	$('#search-word').val("")
		# else
		# 	pattern = new RegExp('^_' + query)
		# 	$(".word").filter (index) ->
		# 		!pattern.test( $(this).attr('id') )
		# 	.hide()

	submitCategory: ->
		attributes = 
			title: $('#category_title').val()
		category = new GRE.Models.Category({title: $('#category_title').val()})
		category.save null, success: (category) ->
			console.log "new category: " + category.get("title")
			GREroute.navigate("/categories/"+category.get("title"), {trigger: true})



