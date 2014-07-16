'use strict'

notFoundState = angular.module 'bk.states.about', []

notFoundState.config ($stateProvider) ->
    $stateProvider.state 'about',
        url: '/about'
        parent: 'default'
        views:
            header:
                templateUrl: 'partials/partials/header.html'
            content:
                templateUrl: 'partials/states/about.html'