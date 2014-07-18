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
                deferred = $q.defer()
                database.$child(ID).$on 'loaded', (result) ->
                    if result
                        deferred.resolve result
                    else
                        deferred.reject result
                return deferred.promise

            getIdByUser: (name) ->
                deferred = $q.defer()
                @getUsers().then (userList) ->
                    for id, user of userList
                        if name == user.name
                            deferred.resolve id
                            return deferred.promise
                    deferred.reject false
                    return deferred.promise

            getUserId: ->
                cookie.getCookie()

            addUser: (account) ->
                deferred = $q.defer()
                @getUsers().then (userList) ->
                    for id, user of userList
                        if account.name.toLowerCase == user.name.toLowerCase
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

            loginUser: (account) ->
                deferred = $q.defer()
                @getUsers().then (userList) ->
                    for id, user of userList
                        if account.name.toLowerCase == user.name.toLowerCase && user.pass == md5.createHash account.pass
                            database.$child(id).$update({
                                isLoggedIn: true
                            })
                            cookie.setCookie(id)
                            deferred.resolve user.name
                            return
                    deferred.reject "Credentials invalid"
                , (err) ->
                    deferred.reject err
                deferred.promise

            logoffUser: ->
                if cookie.isCookieSet()
                    database.$child(cookie.getCookie()).$update({
                        isLoggedIn: false
                    })
                    cookie.deleteCookie()

            isUserLogged: ->
                deferred = $q.defer()
                if cookie.isCookieSet()
                    @getUsers().then (userList) ->
                        for id, user of userList
                            if cookie.getCookie() == id
                                deferred.resolve true
                                return
                        deferred.reject err
                    , (err) ->
                        deferred.reject err
                    deferred.promise

            getParsedUserList: ->
                deferred = $q.defer()
                properList = {}
                @getUsers().then (userList) ->
                    for id, user of userList
                        properList[id] = {
                            name: user.name
                            isLoggedIn: user.isLoggedIn
                        }
                    deferred.resolve properList
                    return properList
        }
]