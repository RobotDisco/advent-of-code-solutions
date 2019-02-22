"
An AOC2018Day2Test is a test class for testing the behavior of AOC2018Day2
"
Class {
	#name : #AOC2018Day2Test,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests'
}

{ #category : #tests }
AOC2018Day2Test >> testA1Example [
	| input content |
	content := #('abcdef' 'bababc' 'abbcde' 'abcccd' 'aabcdd' 'abcdee' 'ababab')
		reduce: [ :a :b | a , String lf , b ].
	input := AOCInput withContent: content.
	self assert: (AOC2018Day2A withInput: input) star equals: 12
]
