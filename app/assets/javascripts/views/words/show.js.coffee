class GRE.Views.WordShow extends Backbone.View

	template: JST['words/show']
	className: "row-fluid word"

	events:
		"click .edit_word": 'editWord'
		"click .remove_word": 'removeWord'

	initialize: ->
		@model.on('destroy', @close, this)
		@model.on('change', @render, this)
  

	render: ->
		$(@el).html(@template({model: @model}))
		@$(".content-tips").html(GRE.prettyText(@model.get('tips')));
		@$(".content-sen").html(GRE.prettyText(@model.get('sen')));
		@$(".content-root").html(GRE.prettyText(@model.get('root')));
		@$(".content-root").html(GRE.prettyText(@model.get('note')));

		$(@el).attr('id', @model.get('title'))
		$(@el).attr('data-wid', @model.id)
		this

	editWord: ->
		Backbone.submitType = "Edit"
		$('#word_modal').attr('data-wid', @model.id)

		$('#word_title').val(@model.get('title'))
		$('#word_meaning').val(@model.get('meaning'))
		$('#word_sen').val(@model.get('sen'))
		$('#word_tips').val(@model.get('tips'))
		$('#word_root').val(@model.get('root'))
		$('#word_note').val(@model.get('note'))


	removeWord: ->
		console.log "remove"
		@model.destroy()

	close: =>
		this.remove()
		this.unbind()
		this.model.unbind("change", this.modelChanged)