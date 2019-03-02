"
An AOC2018Day3Test is a test class for testing the behavior of AOC2018Day3
"
Class {
	#name : #AOC2018Day3Test,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests'
}

{ #category : #tests }
AOC2018Day3Test >> testA1Example [
	| input content |
	content := Character lf join: #(
	'#1 @ 1,3: 4x4'
	'#2 @ 3,1: 4x4'
	'#3 @ 5,5: 2x2'
).
	input := AOCInput withContent: content.
	self assert: (AOC2018Day3A withInput: input) star equals: 4
]

{ #category : #tests }
AOC2018Day3Test >> testB1Example [
	| input content |
	content := Character lf
		join: #('#1 @ 1,3: 4x4' '#2 @ 3,1: 4x4' '#3 @ 5,5: 2x2').
	input := AOCInput withContent: content.
	self assert: (AOC2018Day3B withInput: input) star equals: 3
]
