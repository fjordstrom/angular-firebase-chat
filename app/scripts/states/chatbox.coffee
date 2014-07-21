chatbox = angular.module 'ac.states.chatbox', ['ac.firebase.messages']

chatbox.config ($stateProvider) ->
    $stateProvider.state 'userPanel.chatbox',
        url: '/:username'
        templateUrl : 'partials/states/chatbox.html'
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
        '$rootScope'
        '$stateParams'
        'acMessages'
    ]
    constructor: (@$scope, @$rootScope, @$stateParams, @messages) ->
        @$scope.username = $stateParams.username

        @messages.getConvMessages($scope.user.name,$stateParams.username).then (result) ->
            $rootScope.messageList = result;


chatbox.controller "ChatBox_Controller", ChatBox_Controller