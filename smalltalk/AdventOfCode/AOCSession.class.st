"
I represent an Advent of Code Authentication Session

I provide the token which represents an authenticated session of an Advent of Code user. This token is provided to me on initialization.

Public methods:
- session - Return the session key that was provided on instantiation

Example:
	AOCSession new: 'xxxmysessiontokenyyy'

Internal Representation and Key Implementation Points.

    Instance Variables
	session:		<String>

    Implementation Points
	The session key can be found by accessing the adventofcode website from an authorized browser. It can be found as the value of your 'session' cookie.
	
	TODO if it's worth my while, learn how to use ZnClient to authenticate with adventofcode via oauth
"
Class {
	#name : #AOCSession,
	#superclass : #Object,
	#instVars : [
		'session'
	],
	#category : #AdventOfCode
}

{ #category : #initialization }
AOCSession class >> withSession: session [
	^ self new session: session.
]

{ #category : #accessing }
AOCSession >> session [
	"Return the authenticated token for the user"

	^session
]

{ #category : #accessing }
AOCSession >> session: newSession [
	"Set the authentication token" 

	session := newSession.
]
