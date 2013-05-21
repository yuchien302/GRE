window.GRE =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	initialize: -> 
		new GRE.Routers.Words
		Backbone.history.start({pushState: true})

$(document).ready ->
	GRE.initialize()
	$('#wordlist').on 'hover', '.word', ->
		$('.word-panel', this).toggle()