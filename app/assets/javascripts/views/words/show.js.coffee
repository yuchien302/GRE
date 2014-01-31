class GRE.Views.WordShow extends Backbone.View

	template: JST['words/show']
	className: "row word"

	events:
		"click .edit_word": 'editWord'
		"click .remove_word": 'removeWord'
		"click .state-master": 'stateMaster'
		"click .state-forgot": 'stateForgot'

	initialize: ->
		@model.on('destroy', @close, this)
		@model.on('change', @render, this)
  

	render: ->

		$(@el).html(@template({model: @model}))
		@$(".content-meaning").html(GRE.prettyText(@model.get('meaning')));
		@$(".content-tips").html(GRE.prettyText(@model.get('tips')));
		@$(".content-sen").html(GRE.prettyText(@model.get('sen')));
		@$(".content-root").html(GRE.prettyText(@model.get('root')));
		@$(".content-note").html(GRE.prettyText(@model.get('note')));
		if @model.get('root') == "*"
			$(@el).addClass('word-root')

		# $(@el).attr('id', "_" + @model.get('title'))
		$(@el).attr('data-wid', @model.id)
		this


	editWord: ->
		Backbone.submitType = "Edit"
		$('#word_modal').attr('data-wid', @model.id)
		
		# $('#word_title_preview').html(GRE.prettyText(@model.get('title')))
		# $('#word_meaning_preview').html(GRE.prettyText(@model.get('meaning')))
		# $('#word_tips_preview').html(GRE.prettyText(@model.get('tips')))
		# $('#word_sen_preview').html(GRE.prettyText(@model.get('sen')))
		# $('#word_root_preview').html(GRE.prettyText(@model.get('root')))
		# $('#word_note_preview').html(GRE.prettyText(@model.get('note')))

		$('#word_title').val(@model.get('title'))
		$('#word_meaning').val(@model.get('meaning'))
		$('#word_tips').val(@model.get('tips'))
		$('#word_sen').val(@model.get('sen'))
		$('#word_root').val(@model.get('root'))
		$('#word_note').val(@model.get('note'))


	removeWord: ->
		sure = confirm "確定嗎QQ?"
		@model.destroy() if sure

	stateMaster: ->
		@model.reviews.create({state: "master"})

	stateForgot: ->
		@model.reviews.create({state: "forgot"})

	close: =>
		this.remove()
		this.unbind()
		this.model.unbind("change", this.modelChanged)