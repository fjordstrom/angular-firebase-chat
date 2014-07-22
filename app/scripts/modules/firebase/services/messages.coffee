fbmodule = angular.module 'ac.firebase.messages', ['ac.firebase.databaseCreator']

fbmodule.config [
    'firebaseHandleProvider'
    (firebaseHandleProvider) ->
        firebaseHandleProvider.setDatabase 'message', 'messages'
]

fbmodule.factory 'acMessages', [
    'firebaseHandle'
    '$q'
    (firebaseHandle, $q) ->
        database = firebaseHandle.getDatabase firebaseHandle.availableDatabases.message
        return {
            getMessages: ->
                deferred = $q.defer()
                database.$on 'loaded', (result) ->
                    if result
                        deferred.resolve result
                    else
                        deferred.reject result
                return deferred.promise

            getConvMessages: (receiver, sender) ->
                deferred = $q.defer()
                messageList = {}
                @getMessages().then (preList) =>
                    for id, msg of preList
                        if @belongsToConversation(receiver,sender,msg)
                            messageList[id] = msg
                    deferred.resolve messageList
                return messageList

            belongsToConversation: (receiver,sender,message) ->
                receiver == message.to and sender == message.from or
                    receiver == message.from and sender == message.to

#            isMessageMine: (sender,message) ->
#                sender == message.from

            getListOfNumberOfUnreadMessages: (user) ->
                deferred = $q.defer()
                numberList = {}
                @getMessages().then (preList) ->
                    for id, msg of preList
                        if msg.to == user && msg.isRead == false
                            if numberList[msg.from]
                                numberList[msg.from] += 1
                            else
                                numberList[msg.from] = 1
                    deferred.resolve numberList
                return numberList

            addMessageToDB: (from,to,message) ->
                deferred = $q.defer()
                database.$add(
                    from: from
                    to: to
                    message: message
                    timestamp: Firebase.ServerValue.TIMESTAMP
                    isRead: false
                ).then (resolve) ->
                    deferred.resolve resolve
                , (err) ->
                    deferred.reject err


            messageWasAdded: (user1, user2, func) ->
                if func
                    database.$on "child_added", (message) =>
                        if belongs = @belongsToConversation(user1,user2,message.snapshot.value)
                            func(message.snapshot.value,message.snapshot.name)

            modifyMessage: (id,newText) ->
                database.$child(id).$update({
                    message: newText
                })

        }
]