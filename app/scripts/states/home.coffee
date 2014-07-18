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
        'acUsers'
        '$state'
    ]
    constructor: (@$scope, @acUsers, @$state) ->

    login: (account) ->
        console.log "HERE"
        @acUsers.authUser(account).then (user) =>

            @acUsers.getIdByUser("Ratonul").then (id_found) =>
                @$scope.user = {
                    name: account.name
                    id: id_found
                }
            @$state.go 'userPanel'
        , (err) ->
            alert "#{err.desc}"

awesomeChat.controller "awesomeChat_controller", awesomeChat_controller