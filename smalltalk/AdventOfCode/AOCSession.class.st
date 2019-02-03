"
I represent an Advent of Code Authentication Session

I provide the token which represents an authenticated session of an Advent of Code user. This token is provided to me on initialization.

Example:
	AOCSession new: 'xxxmysessiontokenyyy'
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
