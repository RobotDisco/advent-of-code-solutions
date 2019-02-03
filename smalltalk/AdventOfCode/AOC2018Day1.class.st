"
Advent of Code Day 1
"
Class {
	#name : #AOC2018Day1,
	#superclass : #Object,
	#instVars : [
		'session'
	],
	#category : #AdventOfCode
}

{ #category : #accessing }
AOC2018Day1 class >> withSession: session [
	^ self new session: session
]

{ #category : #accessing }
AOC2018Day1 >> firstStar [
	"compute content of first star"

	| input result |
	"Fetch input from adventofcode.com"
	input := AOCInput year: 2018 day: 1 session: (session session).
	"Convert input into series of integers"
	result := input content substrings collect: [ :x | x asInteger ].
	"Reduce via summing"
	result := result reduce: [ :a :b | a + b ].
	^ result
]

{ #category : #accessing }
AOC2018Day1 >> session: newSession [
	session := newSession
]
