Class {
	#name : #AOCFabricClaim,
	#superclass : #Object,
	#instVars : [
		'id',
		'top',
		'left',
		'bottom',
		'right'
	],
	#category : #AdventOfCode
}

{ #category : #'instance creation' }
AOCFabricClaim class >> fromString: string [
	"comment stating purpose of message"

	(self regex search: string)
		ifTrue: [ ^ (self new)
				fromString: string;
				yourself ]
		ifFalse: [ ^ nil ]
]

{ #category : #'accessing - private' }
AOCFabricClaim class >> regex [
	"comment stating purpose of message"

	^ '#(\d+) @ (\d+),(\d+)\: (\d+)x(\d+)' asRegex
]

{ #category : #enumerating }
AOCFabricClaim >> allPoints [
	"comment stating purpose of message"

	| acc |
	acc := (left to: right)
		flatCollectAsSet: [ :x | (top to: bottom) collect: [ :y | x @ y ] ].
	^ acc
]

{ #category : #'instance creation' }
AOCFabricClaim >> fromString: string [
	"comment stating purpose of message"

	| re horizontalWidth verticalWidth |
	re := self class regex.
	re matches: string.
	id := (re subexpression: 2) asInteger.
	left := (re subexpression: 3) asInteger.
	top := (re subexpression: 4) asInteger.
	horizontalWidth := (re subexpression: 5) asInteger.
	verticalWidth := (re subexpression: 6) asInteger.
	right := left + horizontalWidth - 1.
	bottom := top + verticalWidth - 1
]

{ #category : #accessing }
AOCFabricClaim >> id [

^ id
]
