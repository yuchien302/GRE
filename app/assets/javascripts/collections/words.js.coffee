class GRE.Collections.Words extends Backbone.Collection
	

	model: GRE.Models.Word

	initialize: (id) ->
		if id
			@url = '/api/categories/' + id + '/words'
		else
			@url = '/api/words'
	# comparator: (word) ->
	# 	title = word.get('title')
	# 	if title[0] == "-"
	# 		return "zzzzz" + title.substr(1, title.length).toLowerCase()
	# 	return title.toLowerCase()


	# comparator: (word1, word2) ->
	# 	title1 = word1.get('title')
	# 	title2 = word2.get('title')

	# 	if title1[0]=='-'
	# 		title1 = "zzzzz"+title1.substr(1, title1.length)
	# 	if title2[0]=='-'
	# 		title2 = "zzzzz"+title2.substr(1, title2.length)

	# 	if( title1.toLowerCase()==title2.toLowerCase() )
	# 		if title1 > title2
	# 			return 1
	# 		else if title1 < title2
	# 			return -1
	# 		else
	# 			return 0
	# 	else

	# 		if title1.toLowerCase() > title2.toLowerCase()
	# 			return 1
	# 		else if title1.toLowerCase() < title2.toLowerCase()
	# 			return -1
	# 		else
	# 			return 0