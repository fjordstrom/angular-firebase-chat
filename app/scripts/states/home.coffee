awesomeChat = angular.module 'ac.states.home', ['firebase']

awesomeChat.config ($stateProvider) ->
    $stateProvider.state 'home',
        url: '/'
        parent: 'default'
        views:
            header:
                templateUrl: 'partials/partials/header.html'
            content:
                templateUrl: 'partials/states/home.html'
                controller: awesomeChat_controller
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
        'firebaseHandle'
        'userList'
    ]
    constructor: (@$scope,@firebaseHandle, userList) ->
        #console.log "do stuff"
        @$scope.userList = userList