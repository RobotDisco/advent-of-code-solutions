"
I represent the input of a Advent of Code Question.

Responsibilities:
I fetch and cache input from the Advent of Code website.
I also know the question input Advent Of Code generates for me.

Collaborators:
I get the session token I need, if necessary, from an AOCSession instance supplied on creation.

Public API and Key Messages

- content - Return the input as a ByteString
- asIntegerArray - Return the input as a parsed array of integers   
- class >> year:day:session - Given session object, create instance for specified AOC year/day question.

How to create instances.
	input := AOCInput year: 2018 day: 1 session: session.
How to create instances for testing.
	input := AOCInput withInput: 'some test input'.
 
Internal Representation and Key Implementation Points.

 	 Instance Variables:
	year: <Integer>
	day: <Integer>
	session: <String>
	content: <ByteString>

	 Implemention Points:
	Content is lazily fetched from the adventofcode, and is then cached for the lifetime of the instance.
"
Class {
	#name : #AOCInput,
	#superclass : #Object,
	#instVars : [
		'year',
		'day',
		'session',
		'content'
	],
	#category : #AdventOfCode
}

{ #category : #initialization }
AOCInput class >> withContent: content [
"Create Input instance with pre-supplied content.

Useful for testing or trying sample input"
^self new content: content
]

{ #category : #initialization }
AOCInput class >> year: year day: day session: session [
	"Fetch and cache the input for a given Advent of Code question
	
	year - The year of the Advent of Code question
	day - The day (effectively question number)
	session - The session cookie from an authentication session established elsewhere"

	^ self new
		year: year;
		day: day;
		session: session session;
		yourself
]

{ #category : #converting }
AOCInput >> asIntegerArray [ 
^ self content substrings collect: [ :x | x asInteger ].
]

{ #category : #accessing }
AOCInput >> content [
	"Fetch and return AOC question input data for specified user
	
This is lazily initialized, we only fetch the content on first invocation."

	^ content ifNil: [ self fetchContent. content]
]

{ #category : #accessing }
AOCInput >> content: newContent [
	content := newContent
]

{ #category : #accessing }
AOCInput >> day: anInteger [ 
	day := anInteger
]

{ #category : #fetching }
AOCInput >> fetchContent [
	"Fetch and store user's evaluation input from the adventofcode web site"

	| cookie client |
	cookie := ZnCookie new
		name: 'session';
		value: session;
		domain: 'adventofcode.com'.
	client := ZnClient new.
	client session cookieJar add: cookie.
	content := client
		get:
			('https://adventofcode.com/{1}/day/{2}/input'
				format:
					{year.
					day}).
]

{ #category : #accessing }
AOCInput >> session: aString [ 
	session := aString
]

{ #category : #accessing }
AOCInput >> year: anInteger [ 
	year := anInteger
]
