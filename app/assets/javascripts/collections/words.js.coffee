class GRE.Collections.Words extends Backbone.Collection
	url: '/api/words'

	model: GRE.Models.Word

	comparator: (word) ->
		return word.word