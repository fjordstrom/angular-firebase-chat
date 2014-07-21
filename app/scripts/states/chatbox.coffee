chatbox = angular.module 'ac.states.chatbox', ['ac.firebase.messages']

chatbox.config ($stateProvider) ->
    $stateProvider.state 'userPanel.chatbox',
        url: '/:username'
        templateUrl : 'partials/states/chatbox.html'
        controller: 'ChatBox_Controller as cbCtrl'
        resolve:
            userAuthenticated: [
                'acUsers'
                (acUsers) ->
                    acUsers.isUserLogged()
            ]
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
        'userAuthenticated'
    ]
    constructor: (@$scope, @$rootScope, @$stateParams, @messages, @userAuthenticated) ->
        @$scope.username = $stateParams.username
        @$scope.$parent.chatActive = true
        @$scope.user = @userAuthenticated.user
        @messages.getConvMessages($scope.user.name,$stateParams.username).then (result) ->
            $rootScope.messageList = result;


    sendMessage: (message) ->
        alert "ceva", message


chatbox.controller "ChatBox_Controller", ChatBox_Controller