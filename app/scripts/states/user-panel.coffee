userPanel = angular.module 'ac.states.user-panel', ['ac.firebase.users']

userPanel.config ($stateProvider) ->
    $stateProvider.state 'userPanel',
        url: '/chat'
        parent: 'default'
        views:
            header:
                templateUrl: '/partials/partials/header.html'
            content:
                templateUrl: '/partials/states/user-panel.html'
                controller: "userPanel_controller as userCtrl"
        resolve:
            userAuthenticated: [
                'acUsers'
                (acUsers) ->
                    acUsers.isUserLogged()
            ]
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
        @$scope.$on '$stateChangeStart', (event, toState) =>
            @$scope.chatActive = toState.name == 'userPanel.chatbox'
            
        @$scope.currentUser = @userAuthenticated.user

        @acUsers.getParsedUserList().then (list) =>
            @$scope.usersList = list

    logout: ->
        @acUsers.logoffUser()
        @$state.go 'home'

userPanel.controller "userPanel_controller", userPanel_controller