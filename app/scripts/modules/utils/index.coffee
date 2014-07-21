require './cookies.coffee'
require './message-template.coffee'

fbmodule = angular.module 'ac.utils', [
    'ac.utils.cookies'
    'ac.utils.message-template'
]
