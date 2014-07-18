'use strict'

require './404.coffee'
require './default.coffee'
require './home.coffee'
require './about.coffee'
require './register.coffee'
require './user-panel.coffee'
require './chatbox.coffee'

awesomeChat = angular.module 'ac.states', [
    'ac.states.default'
    'ac.states.404'
    'ac.states.home'
    'ac.states.about'
    'ac.states.register'
    'ac.states.user-panel'
    'ac.states.chatbox'
]