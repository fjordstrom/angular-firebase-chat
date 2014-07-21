messageTemplate = angular.module 'ac.utils.messageTemplate', []

messageTemplate.controller 'Controller', ['$scope', ($scope) ->
    message = $scope.messageList
]

messageTemplate.directive('messageLine', ->
    return {
    template: '{{message.timestamp | date:"HH:mm:ss"}} {{message.from}}: {{message.message}}'
    }

)