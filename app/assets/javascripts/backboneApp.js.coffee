window.GRE =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	Helper: {
		findIndexOfWordsByTitle: (words, title) ->
			idx = -1
			words.each (word, index) ->
				if(word.get("title")==title) 
					idx = index
			return idx

	}
	prettyText: (text) ->
		if(!text)
			return
		pattermb = /\[/
		patterme = /\]/
		begin = text.search(pattermb)
		# count = 1
		while begin != -1
			end = text.search(patterme)
			word = text.substring(begin+1, end)
			link = "<a href=#" + word + ">" + word + "</a>"
			text = text.substring(0, begin) + link + text.substring(end+1)
			
			begin = text.search(pattermb)
		text.split('\n').join('</br>')
	stopScroll: (e) ->
		e.preventDefault()
		console.log "stop"
		# e.stopPropagation()

	initialize: -> 
		window.GREroute = new GRE.Routers.Words
		Backbone.history.start({hashChange: false})
		# Backbone.history.start()


$(document).ready ->
	GRE.initialize()
	# $('#wordlist').on 'hover', '.word', ->
	# 	$('.word-panel', this).toggle()

	# $('a').on 'click', ->
	# 	$('.word').show()

	# $(window).on 'hashchange', ->
	# 	$('.word').show()
	# $(document).on 'keydown', (e) ->
	# 	console.log "press ctrl"
	# 	if e.keyCode==17
	# 		e.preventDefault()
	# 		e.stopPropagation()
	# 		$('.my-editable').attr('contenteditable', false)
			



	