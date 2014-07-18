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
        '$rootScope'
        'acUsers'
        '$state'
    ]
    constructor: (@$scope, @$rootScope, @acUsers, @$state) ->
        if @acUsers.isUserLogged() is false
            @$scope.userLogged = false
            @$state.go 'home'
        else
            this_id = @acUsers.getUserId()
            @acUsers.getUserById(this_id).then (result) =>
                @$rootScope.user = {
                    name: result.name
                    id: this_id
                }

    logout: ->
        @acUsers.logoffUser()
        @$rootScope.userLogged = false
        @$state.go 'home'

userPanel.controller "userPanel_controller", userPanel_controller