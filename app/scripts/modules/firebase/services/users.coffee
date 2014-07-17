fbmodule = angular.module 'ac.firebase.users', ['ac.firebase.databaseCreator','ac.utils.cookies','angular-md5']

fbmodule.config [
    'firebaseHandleProvider'
    (firebaseHandleProvider) ->
        firebaseHandleProvider.setDatabase 'user', 'users'
]

fbmodule.factory 'acUsers', [
    'firebaseHandle'
    'acCookies'
    '$q'
    'md5'
    (firebaseHandle, cookie, $q, md5) ->
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

            addUser: (account) ->
                deferred = $q.defer()
                @getUsers().then (userList) ->
                    for id, user of userList
                        if account.name.lowercase == user.name.lowercase
                            deferred.reject {desc: "The user #{account.name} already exists!"}
                            return

                    database.$add(
                        name: account.name
                        email: account.mail
                        pass: md5.createHash account.pass
                        isLoggedIn: false
                    ).then (resolve) ->
                        deferred.resolve resolve
                    , (err) ->
                        deferred.reject err
                , (err) ->
                    deferred.reject err
                deferred.promise

            authUser: (name,pass) ->
                deferred = $q.defer()
                @getUsers().then (userList) ->
                    for id, user of userList
                        if name.lowercase == user.name.lowercase && md5.createHash pass == user.pass
                            database.$child(id).$update({
                                isLoggedIn: true
                            })
                            cookie.setCookie(id)
                            return
                    deferred.reject "Credentials invalid"
                , (err) ->
                    deferred.reject err
                deferred.promise

            deauthUser: ->

        }

]