"
An AOC2018Day1Test is a test class for testing the behavior of AOC2018Day1
"
Class {
	#name : #AOC2018Day1Test,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests'
}

{ #category : #tests }
AOC2018Day1Test >> testA1Example [
	| input |
	input := AOCInput withContent: '+1, +1, +1'.
	self assert: (AOC2018Day1A withInput: input) star equals: 3
]

{ #category : #tests }
AOC2018Day1Test >> testA2Example [
	| input |
	input := AOCInput withContent: '+1, +1, -2'.
	self assert: (AOC2018Day1A withInput: input) star equals: 0
]

{ #category : #tests }
AOC2018Day1Test >> testA3Example [
	| input |
	input := AOCInput withContent: '-1, -2, -3'.
	self assert: (AOC2018Day1A withInput: input) star equals: -6
]

{ #category : #tests }
AOC2018Day1Test >> testB1Example [
	| input |
	input := AOCInput withContent: '+1, -1'.
	self assert: (AOC2018Day1B withInput: input) star equals: 0
]

{ #category : #tests }
AOC2018Day1Test >> testB2Example [
	| input |
	input := AOCInput withContent: '+3, +3, +4, -2, -4'.
	self assert: (AOC2018Day1B withInput: input) star equals: 10
]

{ #category : #tests }
AOC2018Day1Test >> testB3Example [
	| input |
	input := AOCInput withContent: '-6, +3, +8, +5, -6'.
	self assert: (AOC2018Day1B withInput: input) star equals: 5
]

{ #category : #tests }
AOC2018Day1Test >> testB4Example [
	| input |
	input := AOCInput withContent: '+7, +7, -2, -7, -4'.
	self assert: (AOC2018Day1B withInput: input) star equals: 14
]

{ #category : #tests }
AOC2018Day1Test >> testB5EdgeCase [
"This test ensures we loop over when the input ends"
	| input |
	input := AOCInput withContent: '+1 +1 +1 -4'.
	self assert: (AOC2018Day1B withInput: input) star equals: 0
]
