chatbox = angular.module 'ac.states.chatbox', []

chatbox.config ($stateProvider) ->
    $stateProvider.state 'userPanel.chatbox',
        url: '/:username'
        templateUrl : 'partials/partials/chatbox.html'
        controller: 'ChatBox_Controller as cbCtrl'
        data:
            pageTitle: "Awesome <strong>Chat</strong>"
            meta:
                title: 'Awesome Chat'
                keywords: 'chat, awesome'
                description: 'Chat with awesome people.'

class ChatBox_Controller
    @$inject = [
        '$scope'
    ]
    constructor: (@$scope) ->



chatbox.controller "ChatBox_Controller", ChatBox_Controller