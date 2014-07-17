'use strict';

require "./states/index.coffee"
require "./modules/index.coffee"

app = angular.module 'App', [
    #3rd party modules
    'ngAnimate'
    'ngCookies'
    'ngTouch'
    'ngSanitize'
    'restangular'
    'ui.router'
    'debounce'
    'ac.modules'
    #application modules
    'ac.states'
]
app.config([
    '$urlRouterProvider'
    '$locationProvider'
    ($urlRouterProvider, $locationProvider) ->
        $locationProvider.html5Mode(true).hashPrefix('!')
        $urlRouterProvider.otherwise '/404'

])
app.run ($rootScope) ->
    $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
        console.error 'ERROR ON CHANGE STATE:', error


require './main/main-ctrl.js'

