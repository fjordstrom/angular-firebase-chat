awesomeChat = angular.module 'ac.states.home', []

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
        data:
            pageTitle: "Awesome <strong>Chat</strong>"
            meta:
                title: 'Awesome Chat'
                keywords: 'chat, awesome'
                description: 'Chat with awesome people.'


class awesomeChat_controller
    @$inject = [
        '$scope'
    ]
    constructor: (@$scope) ->
        console.log "do stuff"