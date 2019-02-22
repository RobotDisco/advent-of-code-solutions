"
Advent of Code 2018 Day 2 First Star
"
Class {
	#name : #AOC2018Day2A,
	#superclass : #AOCQuestion,
	#category : #AdventOfCode
}

{ #category : #accessing }
AOC2018Day2A >> star [
	| associations counts twochars threechars |
	associations := input asArray
		collect: [ :each | each asBag sortedCounts ].
	counts := associations
		collect: [ :each | each collect: [ :each1 | each1 key ] into: Set new ].
	twochars := (counts select: [ :each | each includes: 2 ]) size.
	threechars := (counts select: [ :each | each includes: 3 ]) size.
	^ twochars * threechars
]
