'use strict'

notFoundState = angular.module 'bk.states.default', []

notFoundState.config ($stateProvider) ->
    $stateProvider.state 'default',
        abstract: true
        templateUrl: 'partials/states/default.html'