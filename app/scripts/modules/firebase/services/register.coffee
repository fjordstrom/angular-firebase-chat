regmodule = angular.module 'ac.firebase.register', ['ac.firebase.users']

regmodule.config [
    'firebaseHandleProvider'
    (firebaseHandleProvider) ->
        firebaseHandleProvider.setDatabase 'user', 'users'

]


regmodule.factory 'acRegister', [
    'acUsers'
    '$q'
    (users, $q) ->
        return {
            registerUser: (name,email,pass) ->
        }

]