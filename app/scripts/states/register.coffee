register = angular.module 'ac.states.register', ['ac.firebase.users']

register.config ($stateProvider) ->
    $stateProvider.state 'register',
        url: '/register'
        parent: 'default'
        views:
            header:
                templateUrl: 'partials/partials/header.html'
            content:
                templateUrl: 'partials/states/register.html'
                controller: "register_controller as regCtrl"
        data:
            pageTitle: "Awesome <strong>Chat</strong>"
            meta:
                title: 'Awesome Chat'
                keywords: 'chat, awesome'
                description: 'Chat with awesome people.'

class register_controller
    @$inject = [
        '$rootScope'
        '$scope'
        'acUsers'
        '$state'
    ]
    constructor: (@$rootScope, @$scope, @acUsers, @$state) ->
        if @acUsers.isUserLogged()
            @$rootScope.userLogged = true
            console.log 'da'
            @$state.go 'userPanel'

    register: (account) ->
        @acUsers.addUser(account).then (user) ->
            alert "User #{account.name} was succesfully added!"
        , (err) ->
            alert "#{err.desc}"

register.controller "register_controller", register_controller