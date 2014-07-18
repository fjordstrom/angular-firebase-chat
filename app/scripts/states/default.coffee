awesomeChat = angular.module 'ac.states.default', []

awesomeChat.config ($stateProvider) ->
    $stateProvider.state 'default',
        abstract: true
        templateUrl: 'partials/states/default.html'