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

	initialize: -> 
		new GRE.Routers.Words
		Backbone.history.start({hashChange: false})


$(document).ready ->
	GRE.initialize()
	# $('#wordlist').on 'hover', '.word', ->
	# 	$('.word-panel', this).toggle()
	