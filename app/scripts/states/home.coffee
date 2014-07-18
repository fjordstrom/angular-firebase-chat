awesomeChat = angular.module 'ac.states.home', ['ac.firebase.users']

awesomeChat.config ($stateProvider) ->
    $stateProvider.state 'home',
        url: '/'
        parent: 'default'
        views:
            header:
                templateUrl: 'partials/partials/header.html'
            content:
                templateUrl: 'partials/states/home.html'
                controller: "awesomeChat_controller as homeCtrl"
        resolve:
            userList: [
                'acUsers'
                (acUsers) ->
                    acUsers.getUsers()
            ]
        data:
            pageTitle: "Awesome <strong>Chat</strong>"
            meta:
                title: 'Awesome Chat'
                keywords: 'chat, awesome'
                description: 'Chat with awesome people.'

class awesomeChat_controller
    @$inject = [
        '$scope'
        '$rootScope'
        'acUsers'
        '$state'
    ]
    constructor: (@$scope, @$rootScope, @acUsers, @$state) ->
        if @acUsers.isUserLogged()
            @$rootScope.userLogged = true
            @$state.go 'userPanel'

    login: (account) ->
        @acUsers.loginUser(account).then (user) =>
            @acUsers.getIdByUser(account.name).then (id_found) =>
                @$rootScope.user = {
                    name: account.name
                    id: id_found
                }
                @$rootScope.userLogged = true
            @$state.go 'userPanel'
        , (err) ->
            alert "#{err.desc}"

awesomeChat.controller "awesomeChat_controller", awesomeChat_controller