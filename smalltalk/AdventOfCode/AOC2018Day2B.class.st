"
Advent of Code 2018 Day 2 Second Star

We solve this by converting each box ID into set of associatons, the key being the index of the character and the value being the character itself.

We then loop n by n, pairwise, through each duple combination of the list. We consider the difference, which we know will only contain one with a single element (the others being different from each other by in least two positions)

We can convert back to the string of commonalities by taking the intersection, sorting by key so all letters are arrangws by order of position, and concatenating the values.
"
Class {
	#name : #AOC2018Day2B,
	#superclass : #AOCQuestion,
	#instVars : [
		'setList',
		'largestIntersection'
	],
	#category : #AdventOfCode
}

{ #category : #private }
AOC2018Day2B >> convertBackToString [
	^ ''
		join:
			(largestIntersection asSortedCollection
				collect: [ :e | e value ])
]

{ #category : #private }
AOC2018Day2B >> convertToAnnotatedSetList [
	setList := input asArray
		collect: [ :each | 
			(each asArray
				collectWithIndex: [ :each2 :index | index >>> each2 ])
				asSet ]
]

{ #category : #private }
AOC2018Day2B >> findLargestIntersection [
	| set1 set2 currDiff |
	setList
		combinations: 2
		atATimeDo: [ :pair |
			set1 := pair first.
			set2 := pair last.
			currDiff := set1 difference: set2.
			currDiff size = 1
				ifTrue: [ largestIntersection := set1 intersection: set2 ] ]
]

{ #category : #accessing }
AOC2018Day2B >> star [
	self convertToAnnotatedSetList.
	self findLargestIntersection.
	^ self convertBackToString
]
