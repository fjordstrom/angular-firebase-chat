'use strict'
require './404.coffee'
require './default.coffee'
require './home.coffee'
require './about.coffee'

notFoundState = angular.module 'ac.states', [
    'ac.states.default'
    'ac.states.404'
    'ac.states.home'
    'ac.states.about'
]