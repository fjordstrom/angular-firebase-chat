chatbox = angular.module 'ac.states.chatbox', ['ac.firebase.messages']

chatbox.config ($stateProvider) ->
    $stateProvider.state 'userPanel.chatbox',
        url: '/:username'
        templateUrl : '/partials/states/chatbox.html'
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
        @$scope.currentUser = @userAuthenticated.user
        @$scope.messageList = []
        @messages.messageWasAdded  @$scope.currentUser.name, @$stateParams.username, (message,id) =>
            message['id'] = id;
            @$scope.messageList.push message
#            console.log @$scope.messageList
        #@messages.getConvMessages($scope.currentUser.name,$stateParams.username).then (result) ->




    sendMessage: (message) =>
        if @$scope.message?.length
            @messages.addMessageToDB(@$scope.currentUser.name,@$stateParams.username,message)
            @$scope.message = ''
chatbox.controller "ChatBox_Controller", ChatBox_Controller