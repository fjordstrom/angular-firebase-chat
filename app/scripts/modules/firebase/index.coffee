require './services/firebase-handle.coffee'
require './services/users.coffee'

fbmodule = angular.module 'ac.firebase', ['ac.firebase.users']

fbmodule.config [
    'firebaseHandleProvider'
    (firebaseHandleProvider) ->
        firebaseHandleProvider.setDatabaseRootURL 'https://sweltering-fire-8366.firebaseio.com'

]