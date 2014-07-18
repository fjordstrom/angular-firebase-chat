chatbox = angular.module 'ac.states.chatbox', []

chatbox.config ($stateProvider) ->
    $stateProvider.state 'awesome_chat.chatterbox',
        url: '/:username'
        templateUrl : 'views/pages/chatterbox.html'
        controller: 'ChatBox_Controller as cbCtrl'
        data:
            pageTitle: "Awesome <strong>Chat</strong>"
            meta:
                title: 'Chat with awesome people'
                keywords: 'NextCasino, chat, awesome'
                description: 'Chat with awesome people.'

class ChatBox_Controller
    @$inject = [
        '$scope'
    ]
    constructor: (@$scope) ->