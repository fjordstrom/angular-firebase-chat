userPanel = angular.module 'ac.states.user-panel', ['ac.firebase.users']

userPanel.config ($stateProvider) ->
    $stateProvider.state 'userPanel',
        url: '/'
        parent: 'default'
        views:
            header:
                templateUrl: 'partials/partials/header.html'
            content:
                templateUrl: 'partials/states/user-panel.html'
                controller: "userPanel_controller as userCtrl"
        data:
            pageTitle: "Awesome <strong>Chat</strong>"
            meta:
                title: 'Awesome Chat'
                keywords: 'chat, awesome'
                description: 'Chat with awesome people.'

class userPanel_controller
    @$inject = [
        '$scope'
        'acUsers'
        '$state'
    ]
    constructor: (@$scope, @acUsers, @$state) ->

    logout: ->
        @acUsers.logoffUser()
        @$state.go 'home'

userPanel.controller "userPanel_controller", userPanel_controller