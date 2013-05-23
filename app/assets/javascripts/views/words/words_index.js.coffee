class GRE.Views.WordsIndex extends Backbone.View

	template: JST['words/index']

	events: ->
		"click #submit_word": 'submitWord'
		"click #new_word": 'newWord'
		"keyup #search-word": 'searchWord'
		"focus #search-word": 'searchWord'

	initialize: ->
		@collection.on('reset', @render, this)
		@collection.on('add', @render, this)
		@collection.on('change', @render, this)
  
	render: ->
		$(@el).html(@template())
		@collection.sort()
		@collection.each(@appendWord)
		this

	appendWord: (word) =>
		if word.get('title') == ""
			return
		view = new GRE.Views.WordShow(model: word)
		@$("#wordlist").append(view.render().el)
		title = word.get('title')
		$wordview = @$("#" + title)
		title = title.substr(0, title.length-1)
		while ( ( title!="" && @$("#"+title).length == 0 ) )
			$wordview.prepend("<div id=\"" + title + "\" class='word-anchor' ></div>")
			title = title.substr(0, title.length-1)



	newWord: (e) ->
		Backbone.submitType = "New"

		$('#word_title').val("")
		$('#word_meaning').val("")
		$('#word_sen').val("")
		$('#word_tips').val("")
		$('#word_root').val("")
		$('#word_note').val("")
		

	submitWord: (e) ->
		self = this
		e.preventDefault()
		attributes = 
			title: $('#word_title').val()
			meaning: $('#word_meaning').val()
			sen: $('#word_sen').val()
			tips: $('#word_tips').val()
			root: $('#word_root').val()
			note: $('#word_note').val()

		@$('#word_modal').modal('hide')

		if(Backbone.submitType == "New")
			@collection.create attributes,
				wait:true
				success: (word) ->
					console.log "create success!"
				error: (word, msg) ->
					alert "error: " + msg

		else if(Backbone.submitType == "Edit")
			wid = $('#word_modal').attr('data-wid')
			@collection.get(wid).save attributes, 
				wait: true
				success: (story) ->
					console.log "update success!"
				error: (story, msg) ->
					alert "error: " + msg



	searchWord: ->
		location.hash = $('#search-word').val()
		# $(".word").show()
		
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

