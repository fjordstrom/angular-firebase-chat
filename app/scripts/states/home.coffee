awesomeChat = angular.module 'ac.states.home', ['ac.firebase.users']

awesomeChat.config ($stateProvider) ->
    $stateProvider.state 'home',
        url: '/'
        parent: 'default'
        views:
            header:
                templateUrl: '/partials/partials/header.html'
            content:
                templateUrl: '/partials/states/home.html'
                controller: "awesomeChat_controller as homeCtrl"
        resolve:
            redirect: [
                'acUsers'
                '$state'
                '$q'
                (acUsers, $state, $q) ->
                    deferred = $q.defer()
                    acUsers.isUserLogged().then ->
                        $state.go 'userPanel'
                        deferred.resolve()
                    , (err) ->
                        deferred.resolve()

                    deferred.promise
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
        @acUsers.loginUser(account).then (user) =>
            @acUsers.getIdByUser(account.name).then (id_found) =>
                @$scope.currentUser = {
                    name: account.name
                    id: id_found
                    isLoggedin: true
                }
            @$state.go 'userPanel'
        , (err) ->
            alert "#{err.desc}"

awesomeChat.controller "awesomeChat_controller", awesomeChat_controller