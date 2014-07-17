chatModule = angular.module 'ac.utils.firebase-handle', ['firebase']

chatModule.provider 'firebaseHandle', ->
    #TODO put the URL in an external file
    firebaseURL = "https://sweltering-fire-8366.firebaseio.com"

    @$get = [
        "$firebase"
        ($firebase) ->
            users = new Firebase(firebaseURL+"/users")
            messages = new Firebase(firebaseURL+"/messages")
            userBase = $firebase(users)
            messageBase = $firebase(messages)
            service = {
                selectAll: ->
                    userBase
            }
            return  service
    ]
    return @