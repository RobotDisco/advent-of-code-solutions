"
Advent of Code Day 1
"
Class {
	#name : #AOC2018Day1,
	#superclass : #Object,
	#instVars : [
		'session',
		'input'
	],
	#category : #AdventOfCode
}

{ #category : #'as yet unclassified' }
AOC2018Day1 class >> withInput: input [
	"Create instance of day's exercise, evaluating over supplied input
	
	input - data we will use when evaluating an answers for this day"

	^ self new input: input
]

{ #category : #accessing }
AOC2018Day1 >> firstStar [
	"compute content of first star"

	| result |
	"Convert input into series of integers"
	result := input content substrings collect: [ :x | x asInteger ].
	"Reduce via summing"
	result := result reduce: [ :a :b | a + b ].
	^ result
]

{ #category : #accessing }
AOC2018Day1 >> input: myInput [

input := myInput

	
]

{ #category : #accessing }
AOC2018Day1 >> secondStar [
	self shouldBeImplemented.
]
