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
	self assert: (AOC2018Day1A withInput: input) star equals: 3
]

{ #category : #tests }
AOC2018Day1Test >> testExampleA2 [
	| input |
	input := AOCInput withContent: '+1, +1, -2'.
	self assert: (AOC2018Day1A withInput: input) star equals: 0
]

{ #category : #tests }
AOC2018Day1Test >> testExampleA3 [
	| input |
	input := AOCInput withContent: '-1, -2, -3'.
	self assert: (AOC2018Day1A withInput: input) star equals: -6
]

{ #category : #tests }
AOC2018Day1Test >> testExampleB1 [
	| input |
	input := AOCInput withContent: '+1, -1'.
	self assert: (AOC2018Day1B withInput: input) star equals: 0
]

{ #category : #tests }
AOC2018Day1Test >> testExampleB2 [
	| input |
	input := AOCInput withContent: '+3, +3, +4, -2, -4'.
	self assert: (AOC2018Day1B withInput: input) star equals: 10
]

{ #category : #tests }
AOC2018Day1Test >> testExampleB3 [
	| input |
	input := AOCInput withContent: '-6, +3, +8, +5, -6'.
	self assert: (AOC2018Day1B withInput: input) star equals: 5
]

{ #category : #tests }
AOC2018Day1Test >> testExampleB4 [
	| input |
	input := AOCInput withContent: '+7, +7, -2, -7, -4'.
	self assert: (AOC2018Day1B withInput: input) star equals: 14
]
