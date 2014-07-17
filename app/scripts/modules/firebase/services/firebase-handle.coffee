chatModule = angular.module 'ac.firebase.databaseCreator', ['firebase']

chatModule.provider 'firebaseHandle', ->
    #TODO put the URL in an external file
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