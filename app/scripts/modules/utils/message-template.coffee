messageTemplate = angular.module 'ac.utils.messageTemplate', ['ac.firebase.messages']

messageTemplate.directive 'messageLine', ->
    restrict: "A"
    scope:
        message: '=messageLine'
        messageId: '=messageId'
        messageOwner: '=messageOwner'
        messageEdit: '&?'

    templateUrl: '/partials/partials/message-template.html'
    link: ($scope) ->
    	
    	$scope.editMessage = ->
            console.log 'ma-sa', $scope.messageEdit
            $scope.messageEdit(messageId: $scope.messageId, message: $scope.message.message)