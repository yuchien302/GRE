class GRE.Collections.Words extends Backbone.Collection
	url: '/api/words'

	model: GRE.Models.Word

	comparator: (word) ->
		title = word.get('title')
		if title[0] == "-"
			return "zzzzz" + title.substr(1, title.length).toLowerCase()
		return title.toLowerCase()