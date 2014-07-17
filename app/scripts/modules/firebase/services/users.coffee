fbmodule = angular.module 'ac.firebase.users', ['ac.firebase.databaseCreator']

fbmodule.config [
    'firebaseHandleProvider'
    (firebaseHandleProvider) ->
        firebaseHandleProvider.setDatabase 'user', 'users'

]


fbmodule.factory 'acUsers', [
    'firebaseHandle'
    '$q'
    (firebaseHandle, $q) ->
        database = firebaseHandle.getDatabase firebaseHandle.availableDatabases.user
        #console.log 'database', database
        return {
            getUsers: ->
                deferred = $q.defer()
                database.$on 'loaded', (result) ->
                    if result
                        deferred.resolve result
                    else
                        deferred.reject result
                return deferred.promise

            getUserById: (ID) ->
                database.$child(ID).$on 'loaded', (result) ->
                    if result
                        deferred.resolve result
                    else
                        deferred.reject result
                return deferred.promise


        }

]