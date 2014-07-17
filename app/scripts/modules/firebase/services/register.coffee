regmodule = angular.module 'ac.firebase.register', ['ac.firebase.users', 'angular-md5']

regmodule.config [
    'firebaseHandleProvider'
    (firebaseHandleProvider) ->
        firebaseHandleProvider.setDatabase 'user', 'users'

]


regmodule.factory 'acRegister', [
    'acUsers'
    'md5'
    (users,md5) ->
        userBase = users.getUsers
        return {
            registerUser: (name,email,pass)->
                notDuplicate = true

                keys = userBase.getIndex()
                keys.forEach (key) ->
                    if userBase[key].name == name
                        notDuplicate = false

                if notDuplicate
                    userBase.$add {
                        name: name
                        email: email
                        pass: md5.createHash pass
                        isLoggedIn: false
                    }
                else
                    alert "Name already taken!"
        }

]