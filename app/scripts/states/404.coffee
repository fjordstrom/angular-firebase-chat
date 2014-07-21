awesomeChat = angular.module 'ac.states.404', []

awesomeChat.config ($stateProvider) ->
    $stateProvider.state '404',
        url: '/404'
        parent: 'default'
        views:
            header:
                templateUrl: '/partials/partials/header.html'
            content:
                templateUrl: '/partials/states/404.html'