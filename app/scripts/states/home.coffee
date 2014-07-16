'use strict'

addListState = angular.module 'bk.states.home', []

addListState.config ($stateProvider) ->
    $stateProvider.state 'home',
        url: '/'
        parent: 'default'
        views:
            header:
                templateUrl: 'partials/partials/header.html'
            content:
                templateUrl: 'partials/states/home.html'