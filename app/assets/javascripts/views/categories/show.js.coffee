class GRE.Views.CategoryShow extends Backbone.View

	template: JST['categories/show']
	# className: "row word"

	events:
		"click .edit_category": 'editWord'
		"click .remove_category": 'removeWord'

	initialize: ->
		@model.on('destroy', @close, this)
		@model.on('change', @render, this)
  

	render: ->

		$(@el).html(@template({model: @model}))
		this

	close: =>
		this.remove()
		this.unbind()
		this.model.unbind("change", this.modelChanged)

	removeWord: ->
		sure = confirm "確定嗎QQ?"
		@model.destroy() if sure