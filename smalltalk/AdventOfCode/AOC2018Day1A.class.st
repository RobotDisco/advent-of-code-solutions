"
Advent of Code 2018 Day 1 First Star
"
Class {
	#name : #AOC2018Day1A,
	#superclass : #AOCQuestion,
	#category : #AdventOfCode
}

{ #category : #accessing }
AOC2018Day1A >> star [
	| result |
	"Convert input into series of integers"
	result := input asIntegerArray.
	"Reduce via summing"
	result := result reduce: [ :a :b | a + b ].
	^ result
]
