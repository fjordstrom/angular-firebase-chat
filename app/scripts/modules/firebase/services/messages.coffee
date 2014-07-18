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
                @getMessages().then (preList) ->
                    for id, msg of preList
                        if receiver == msg.to and sender == msg.from or receiver == msg.from and sender == msg.to
                            messageList[id] = msg
                    deferred.resolve messageList
                    return messageList

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



        }

]