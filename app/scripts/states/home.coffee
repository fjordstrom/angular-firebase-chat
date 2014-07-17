awesomeChat = angular.module 'ac.states.home', ['firebase','ac.utils.firebase-handle']

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
        'firebaseHandle'
    ]
    constructor: (@$scope,@firebaseHandle) ->
        console.log "do stuff"
        console.log @firebaseHandle.selectAll()