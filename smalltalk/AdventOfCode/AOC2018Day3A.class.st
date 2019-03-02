"
Advent of Code 2018 Day 3 First Star
"
Class {
	#name : #AOC2018Day3A,
	#superclass : #AOCQuestion,
	#instVars : [
		'claims',
		'bag'
	],
	#category : #AdventOfCode
}

{ #category : #'as yet unclassified' }
AOC2018Day3A >> fillBag [
	"comment stating purpose of message"

	| strings |
	bag := Bag new.
	strings := input asArray.
	claims := strings collect: [ :s | AOCFabricClaim fromString: s ].
	claims do: [ :c | bag addAll: c allPoints ].
]

{ #category : #accessing }
AOC2018Day3A >> star [
	| moreThanOnce |
	self fillBag.
	moreThanOnce := 0.
	bag
		doWithOccurrences: [ :e :c | 
			c < 2
				ifFalse: [ moreThanOnce := moreThanOnce + 1 ] ].
	^ moreThanOnce
]
