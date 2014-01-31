class GRE.Views.LearningFinish extends Backbone.View

	template: JST['words/learningFinish']

	events:
		"click .review-all": 'reviewAll'
		"click .review-forgot": 'reviewForgot'

	initialize: ->

	render: ->
		console.log "[learningFinish] render"
		$(@el).html(@template())
		this

	reviewAll: ->
		# alert "reviewAll"
		$.ajax type:"POST", url: "/api/categories/"+@model.id+"/reset-progress", beforeSend: (xhr) -> 
			xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
		, success: (data) ->
			console.log(data)
		

		@trigger("reviewAll")

	reviewForgot: ->
		@trigger("reviewForgot")
		# TODO: If all master should trigger to change state to reviewAll




