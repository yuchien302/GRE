window.GRE =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	prettyText: (text) ->
		pattermb = /\[/
		patterme = /\]/
		begin = text.search(pattermb)
		count = 1
		while begin != -1
			if count == 40
				break;
			count = count + 1
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
		new GRE.Routers.Words
		Backbone.history.start({hashChange: false})


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
			



	