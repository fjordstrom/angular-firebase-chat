cookieModule = angular.module 'ac.utils.cookies', ['ngCookies']


cookieModule.factory 'acCookies', [
    '$cookies'
    ($cookies) ->
        return {
            isCookieSet: ->
                $cookies.loggedCookie?
            deleteCookie: ->
                delete $cookies.loggedCookie
            getCookie: ->
                $cookies.loggedCookie
            setCookie: (id)->
                $cookies.loggedCookie = id
        }
]