'use strict';

require "./states/index.coffee"
require "./modules/index.coffee"

app = angular.module 'App', [
    'ngAnimate'
    'ngCookies'
    'ngTouch'
    'ngSanitize'
    'restangular'
    'ui.router'
    'debounce'
    'ac.modules'
    'ac.states'
]
app.config([
    '$urlRouterProvider'
    '$locationProvider'
    ($urlRouterProvider, $locationProvider) ->
        $locationProvider.html5Mode(true).hashPrefix('!')
        $urlRouterProvider.otherwise '/404'

])
app.run ($rootScope, $state) ->
    $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
        console.error 'ERROR ON CHANGE STATE:', arguments
        if not fromState?.name?.length
            $state.go 'home'
            alert('you are not logged in!');

require './main/main-ctrl.js'

