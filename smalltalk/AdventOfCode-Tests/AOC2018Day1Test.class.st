"
An AOC2018Day1Test is a test class for testing the behavior of AOC2018Day1
"
Class {
	#name : #AOC2018Day1Test,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests'
}

{ #category : #tests }
AOC2018Day1Test >> testExampleA1 [
	| input |
	input := AOCInput withContent: '+1, +1, +1'.
	self assert: (AOC2018Day1 withInput: input) firstStar equals: 3
]

{ #category : #tests }
AOC2018Day1Test >> testExampleA2 [
	| input |
	input := AOCInput withContent: '+1, +1, -2'.
	self assert: (AOC2018Day1 withInput: input) firstStar equals: 0
]

{ #category : #tests }
AOC2018Day1Test >> testExampleA3 [
	| input |
	input := AOCInput withContent: '-1, -2, -3'.
	self assert: (AOC2018Day1 withInput: input) firstStar equals: -6
]
