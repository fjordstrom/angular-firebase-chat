messageTemplate = angular.module 'ac.utils.messageTemplate', ['ac.firebase.messages']

messageTemplate.directive 'messageLine', ['acMessages', (messages) ->
    restrict: "A"
    scope:
        message: '=messageLine'
        owner: '=owner'
        messageId: '=messageId'
    templateUrl: '/partials/partials/message-template.html'
    link: ($scope) ->
        $scope.isBeingEdited = false
        $scope.edit = ->
            if (messages.isMessageMine($scope.owner,$scope.message))
                $scope.isBeingEdited = true
        $scope.doneEdit = ->
            $scope.isBeingEdited = false
            messages.modifyMessage($scope.messageId,$scope.message.message)
]