'use strict'
require './404.coffee'
require './default.coffee'
require './home.coffee'
require './about.coffee'

notFoundState = angular.module 'bk.states', [
    'bk.states.default'
    'bk.states.404'
    'bk.states.home'
    'bk.states.about'
]