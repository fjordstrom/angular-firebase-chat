userPanel = angular.module 'ac.states.user-panel', []

userPanel.config ($stateProvider) ->
    $stateProvider.state 'userPanel',
        url: '/'
        parent: 'default'
        views:
            header:
                templateUrl: 'partials/partials/header.html'
            content:
                templateUrl: 'partials/states/user-panel.html'
                controller: "userPanel_controller as usrCtrl"
        data:
            pageTitle: "Awesome <strong>Chat</strong>"
            meta:
                title: 'Awesome Chat'
                keywords: 'chat, awesome'
                description: 'Chat with awesome people.'


class userPanel_controller
    @$inject = [
        '$scope'
    ]
    constructor: (@$scope) ->


userPanel.controller "userPanel_controller", userPanel_controller