class GRE.Views.CategoriesIndex extends Backbone.View

	template: JST['categories/index']

	initialize: ->
		@collection.on('reset', @render, this)
		@collection.on('add', @render, this)
		@collection.on('change:title', @render, this)
		

	render: ->
		$(@el).html(@template())
 

		@collection.each(@appendCategory)
		this

	appendCategory: (category) =>
		view = new GRE.Views.CategoryShow(model: category)
		@$("#categorylist").prepend(view.render().el)
