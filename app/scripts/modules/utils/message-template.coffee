messageTemplate = angular.module 'ac.utils.messageTemplate', ['ac.firebase.messages']

messageTemplate.directive 'messageLine',  ->
    restrict: "A"
    scope:
        message: '=messageLine'
        owner: '=owner'
        onMessageEdited: '&?'
        messageId: '=messageId'
    templateUrl: '/partials/partials/message-template.html'
    link: ($scope) ->
        $scope.isBeingEdited = false
        $scope.edit = ->
            $scope.isBeingEdited = true
        $scope.doneEdit = ->
            $scope.isBeingEdited = false
            console.log "TAC",$scope.onMessageEdited
            $scope.onMessageEdited($scope.messageId,$scope.message.message)