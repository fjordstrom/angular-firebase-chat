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
                controller: register_controller
        data:
            pageTitle: "Awesome <strong>Chat</strong>"
            meta:
                title: 'Awesome Chat'
                keywords: 'chat, awesome'
                description: 'Chat with awesome people.'

class register_controller
    @$inject = [
        '$scope'
        'acUsers'
    ]
    constructor: (@$scope, acUsers) ->
        acUsers.addUser('dick','dick','dick').then (user) ->
            alert "Succesfully added"
        , (err) ->
            alert "#{err.desc}"