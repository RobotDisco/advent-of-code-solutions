"
I am an abstract class representing an Advent of Code Question 

I provide the structure for implementing the exercise required to compute an answer which, supplied to the adventofcode website, will earn me a star (or not :)

On instantiation I am supplied with the AOCInput instance I will compute the answer from. 

Public API and Key Messages

- star - Return the value for the question/star I represent. This must be implemented by the concrete classes subclassing me.

Example of instantiation:
secondstar := AOC2018Day1B withInput: (AOCInput year: 2018 day: 01 session: mysessionobject).
 
Internal Representation and Key Implementation Points.

    Instance Variables
	input:		<AOCInput>

    Implementation Points
	TODO It would be nice if I could use this class to submit my answer as well.
"
Class {
	#name : #AOCQuestion,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode
}

{ #category : #initialization }
AOCQuestion class >> withInput: input [
	"Create instance of day's exercise, evaluating over supplied input
	
	input - data we will use when evaluating an answers for this day"

	^ self new input: input
]

{ #category : #accessing }
AOCQuestion >> input: myInput [

input := myInput

	
]

{ #category : #accessing }
AOCQuestion >> star [
^ self subclassResponsibility 
]
