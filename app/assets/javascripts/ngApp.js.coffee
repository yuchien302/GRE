app = angular.module("GRE", ["ngResource"])

app.factory "Word", ["$resource", ($resource) ->
  $resource("/api/words/:id", {id: "@id"})
]

@GRECtrl = ["$scope", "Word", ($scope, Word) ->
  $scope.words = Word.query()
  

   
]