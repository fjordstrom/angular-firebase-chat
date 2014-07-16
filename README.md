Awesome Chat - V2.0
-------

Feature List:
-------
- Awesome Chat
- Simple Login
- Real-Time Messaging


Bug List:
-------
It doesn’t exist … 

Structure:
-------
	HomePage
	|
	|
	V
	|___>_____Register - unique state
	|	|
	V   /\
	|   |
	|___Sign in - unique state
	|
	V
	|___Chat -> List of users (online and offline)____>____Sign out -> HomePage
	       |
	       V
	       |___Talk with one of them ___>___Sign out -> HomePage




States
-------


sign in state ---- user state
			--chat box
	         ---- register state

User enters sign in state, either wants to register (direct to register state), or signs in (enters user state). User opens convo with another user (chat box state)



Services
--------

firebase DB connect
	get db URL from a file, conn
	assert error if it doesn't wanna

get messages and parse (for an user)
	basically, all data pertaining to user that requests

get users and parse (for an user)
	index by name
	give name and online status


find user
	look into DB, give userID or nothing

handle cookies
	set cookie
	delete cookie
	retrieve cookie

auth user
	get user and get his pass, if matches, ok, else error

register user
	verify is user is in DB, if not, then go ahead and reg, else error

write user in DB
	user, pass to DB

look for unread status in own messagesși una care ascultă event-uri de modificare ale bazei de date și updatează lista de mesaje necitite

message DB event listener
	should tell another service if a message for current user arrives
