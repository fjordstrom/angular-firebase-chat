regmodule = angular.module 'ac.firebase.register', ['ac.firebase.users']

regmodule.config [
    'firebaseHandleProvider'
    (firebaseHandleProvider) ->
        firebaseHandleProvider.setDatabase 'user', 'users'

]


regmodule.factory 'acRegister', [
    'acUsers'
    (users,md5) ->
        userBase = users.getUsers.then
        return {
            registerUser: (name,email,pass)->
                notDuplicate = true
                #keys = userBase.getIndex()
                angular.forEach userBase, (key) ->
                    console.log key
                    if userBase[key].name == name
                        notDuplicate = false

                if notDuplicate
                    users.addUser(email,name,pass)
                else
                    alert "Name already taken!"
        }

]