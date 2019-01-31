"
I represent the input of a Advent of Code Question.

I fetch input from the Advent of Code website.
I know the user's credential and the question I am the input for.
I also know the question input Advent Of Code generates for me.

UNCOMPLETED TEMPLATE FOLLOWS
For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #AOCInput,
	#superclass : #Object,
	#instVars : [
		'year',
		'day',
		'session'
	],
	#category : #AdventOfCode
}

{ #category : #'as yet unclassified' }
AOCInput class >> year: year day: day session: session [
	"Fetch and cache the input for a given Advent of Code question
	
	year - The year of the Advent of Code question
	day - The day (effectively question number)
	session - The session cookie from an authentication session established elsewhere"

	^ self new
		year: year;
		day: day;
		session: session;
		yourself.
]

{ #category : #accessing }
AOCInput >> content [
	"Fetch and return AOC question input data for specified user"

	| cookie client |
	cookie := ZnCookie new
		name: 'session';
		value: session;
		domain: 'adventofcode.com'.
	client := ZnClient new.
	client session cookieJar add: cookie.
	^ client get: ('https://adventofcode.com/{1}/day/{2}/input' format: { year. day. })
]

{ #category : #accessing }
AOCInput >> day: anInteger [ 
	day := anInteger
]

{ #category : #accessing }
AOCInput >> session: aString [ 
	session := aString
]

{ #category : #accessing }
AOCInput >> year: anInteger [ 
	year := anInteger
]
