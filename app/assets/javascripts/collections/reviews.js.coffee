class GRE.Collections.Reviews extends Backbone.Collection
	# model: GRE.Models.Review
	initialize: (id) ->
		@url = '/api/words/' + id + '/reviews/'