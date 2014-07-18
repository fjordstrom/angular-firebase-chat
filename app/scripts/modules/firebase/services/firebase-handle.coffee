chatModule = angular.module 'ac.firebase.databaseCreator', ['firebase']

chatModule.provider 'firebaseHandle', ->
    firebaseURL = ""
    DataBases = {}

    @setDatabaseRootURL = (URL) ->
        firebaseURL = URL

    @setDatabase = (key, url) ->
        DataBases[key] = url

    @$get = [
        "$firebase"
        ($firebase) ->
            service =
                availableDatabases: DataBases
                getDatabase: (database)->
                    db = $firebase new Firebase("#{firebaseURL}/#{database}")

            return  service
    ]
    return @