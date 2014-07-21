userPanel = angular.module 'ac.states.user-panel', ['ac.firebase.users']

userPanel.config ($stateProvider) ->
    $stateProvider.state 'userPanel',
        url: '/chat'
        parent: 'default'
        views:
            header:
                templateUrl: 'partials/partials/header.html'
            content:
                templateUrl: 'partials/states/user-panel.html'
                controller: "userPanel_controller as userCtrl"
        resolve:
            userAuthenticated: [
                'acUsers'
                (acUsers) ->
                    acUsers.isUserLogged()
            ]
#        onEnter: ->
#            console.log 'enter', arguments
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
        'userAuthenticated'
    ]
    constructor: (@$scope, @$rootScope, @acUsers, @$state, @userAuthenticated) ->
        @$scope.chatActive = false
#        console.log "ceva", @userAuthenticated
        @$scope.user = @userAuthenticated.user

        @acUsers.getParsedUserList().then (list) =>
            @$scope.usersList = list

    logout: ->
        @acUsers.logoffUser()
        #@$scope.userLogged = false
        @$state.go 'home'

userPanel.controller "userPanel_controller", userPanel_controller