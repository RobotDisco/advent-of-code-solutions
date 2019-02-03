"
Advent of Code 2018 Day 1 Second Star
"
Class {
	#name : #AOC2018Day1B,
	#superclass : #AOCQuestion,
	#category : #AdventOfCode
}

{ #category : #accessing }
AOC2018Day1B >> star [
	| array dictionary curr idx |
	"Convert input into series of integers"
	array := input asIntegerArray.
	"Dictionary will capture previous sum results"
	dictionary := Dictionary new.
	"Zero is our starting result so mark it as visited.
	curr will contain our current sum so we can return it when we find a previously visted value."
	curr := 0.
	dictionary at: curr put: #true.

	"Unfortunately I may have to loop multiple times, so I can't rely on an array iterator.
	Instead I will use an idx counter and increment it via modulo addition."
	idx := 0.
	
	"Repeat over this block until I exit from within, then return the value"
	^ [ "Add the current input array value with the previous sum."
	curr := curr + array at: idx + 1.
	"Have we seen the resulting sum already? If so, exist and return that value.
		Otherwise, mark it as visited and move on."
	dictionary at: curr ifPresent: [ ^ curr ] ifAbsentPut: #true.
	"Increment our index counter, looping back to 0 if we reach the size of the array."
	idx := (idx + 1) % array size ] repeat
]
