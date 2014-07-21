messageTemplate = angular.module 'ac.utils.messageTemplate', []

messageTemplate.directive 'messageLine', ->
    restrict: "A"
    scope:
        message: '=messageLine'

    templateUrl: '/partials/partials/message-template.html'
    link: ($scope) ->