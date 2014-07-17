fbmodule = angular.module 'ac.firebase.users', ['ac.firebase.databaseCreator','angular-md5']

fbmodule.config [
    'firebaseHandleProvider'
    (firebaseHandleProvider) ->
        firebaseHandleProvider.setDatabase 'user', 'users'
]

fbmodule.factory 'acUsers', [
    'firebaseHandle'
    '$q'
    'md5'
    (firebaseHandle, $q,md5) ->
        database = firebaseHandle.getDatabase firebaseHandle.availableDatabases.user
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
            addUser: (name,email,pass) ->
                database.$add {
                    name: name
                    email: email
                    pass: md5.createHash pass
                    isLoggedIn: false
                }

        }

]