awesomeChat = angular.module 'ac.states.about', []

awesomeChat.config ($stateProvider) ->
    $stateProvider.state 'about',
        url: '/about'
        parent: 'default'
        views:
            header:
                templateUrl: 'partials/partials/header.html'
            content:
                templateUrl: 'partials/states/about.html'