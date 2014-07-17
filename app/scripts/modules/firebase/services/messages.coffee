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
                keys = $database.getMessages.$getIndex()
                keys.forEach (key) ->
                database.$child(key).$on 'loaded', (result) ->
                    if result
                        deferred.resolve result
                    else
                        deferred.reject result
                return deferred.promise
        }

]