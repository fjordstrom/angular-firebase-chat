messageTemplate = angular.module 'ac.utils.messageTemplate', ['ac.firebase.messages']

messageTemplate.directive 'messageLine', ['acMessages', (messages) ->
    restrict: "A"
    scope:
        message: '=messageLine'
        messageId: '=messageId'
        messageOwner: '=messageOwner'

    templateUrl: '/partials/partials/message-template.html'
    link: ($scope) ->
    	
    	$scope.editMessage = ->
    		messages.editMyMessage($scope.messageId, $scope.message.message)
]