'use strict';

require "./states/index.coffee"
require './modules/utils/index.coffee'

app = angular.module 'App', [
    #3rd party modules
    'ngAnimate'
    'ngCookies'
    'ngTouch'
    'ngSanitize'
    'restangular'
    'ui.router'
    'debounce'

    #application modules
    'bk.states'
    'bk.utils'
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

