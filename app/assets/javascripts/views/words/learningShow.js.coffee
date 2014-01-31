class GRE.Views.LearningShow extends Backbone.View

	template: JST['words/learningShow']
	className: "flip-container"

	events:
		"click .state-master": 'stateMaster'
		"click .state-forgot": 'stateForgot'
		"click .state-next": 'stateNext'

	initialize: ->
		@model.on('destroy', @close, this)
		@model.on('change', @render, this)
  

	render: ->
		console.log "[learningShow] render"
		$(@el).html(@template({model: @model}))
		@$(".content-meaning").html(GRE.prettyText(@model.get('meaning')));
		@$(".content-tips").html(GRE.prettyText(@model.get('tips')));
		@$(".content-sen").html(GRE.prettyText(@model.get('sen')));
		@$(".content-root").html(GRE.prettyText(@model.get('root')));
		@$(".content-note").html(GRE.prettyText(@model.get('note')));
		if @model.get('root') == "*"
			$(@el).addClass('word-root')


		$(@el).attr('data-wid', @model.id)
		this


	stateMaster: ->
		@model.reviews.create({state: "master"})
		$(@el).addClass("toggle")
		@state = "master"
		

	stateForgot: ->
		@model.reviews.create({state: "forgot"})
		$(@el).addClass("toggle")
		@state = "forgot"

	stateNext: ->
		if(@state == "master")
			$(@el).addClass("leave-master")
		else
			$(@el).addClass("leave-forgot")
		this.trigger("next")

	close: =>
		this.remove()
		this.unbind()
		this.model.unbind("change", this.modelChanged)