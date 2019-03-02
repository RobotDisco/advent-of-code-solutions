Class {
	#name : #AOC2018Day3B,
	#superclass : #AOC2018Day3A,
	#category : #AdventOfCode
}

{ #category : #accessing }
AOC2018Day3B >> star [
	| pixelsPainted |
	self fillBag.
	claims
		do: [ :c | 
			pixelsPainted := c allPoints
				collect: [ :p | (bag occurrencesOf: p) = 1 ].
			(pixelsPainted includes: false)
				ifFalse: [ ^ c id ] ]
]
