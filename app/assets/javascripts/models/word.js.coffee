class GRE.Models.Word extends Backbone.Model
	
	validate: (attrs) ->
		if (attrs.word == "")
			return "單詞呢?詞呢!?"