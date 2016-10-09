_ = require 'lodash/math'

binarySearch = (numbers, numberToFind, acc = 0,lowestIndex = 0,
highestIndex = numbers.length - 1) ->
  acc++
  candidateIndex = _.floor(_.mean([lowestIndex, highestIndex]))
  console.log "Attempt:#{acc}. Find:#{numberToFind}.
   CandidateIndex:#{candidateIndex}. Value:#{numbers[candidateIndex]}"

  if numberToFind is numbers[candidateIndex]
    console.log "Found it in #{acc} attempts."
    acc
  else if numberToFind > numbers[candidateIndex]
    lowestIndex = candidateIndex + 1
    console.log "Upper: #{acc}, #{lowestIndex}, #{highestIndex}"
    binarySearch(numbers, numberToFind, acc, lowestIndex, highestIndex)
  else
    highestIndex = candidateIndex - 1
    console.log "Lower: #{acc}, #{lowestIndex}, #{highestIndex}"
    binarySearch(numbers, numberToFind, acc, lowestIndex, highestIndex)

Algorithm = exports? and exports or @Algorithm = {}

class Algorithm.Search
  binarySearch: binarySearch
