_ = require 'lodash/math'

binarySearch = (numbers, numberToFind, acc = 0,lowestIndex = 0,
highestIndex = numbers.length - 1) ->
  acc++
  candidateIndex = _.floor(_.mean([lowestIndex, highestIndex]))
  console.log "Attempt:#{acc}. Find:#{numberToFind}.
  CandidateIndex:#{candidateIndex} with value:#{numbers[candidateIndex]}"
  candidate = numbers[candidateIndex]
  if numberToFind is candidate
    console.log "Found #{numberToFind} in #{acc} attempts."
    acc
  else if numberToFind > candidate
    lowestIndex = candidateIndex + 1
    if lowestIndex > highestIndex
      notFound numberToFind, acc
    else
      binarySearch(numbers, numberToFind, acc, lowestIndex, highestIndex)
  else if numberToFind < candidate
    highestIndex = candidateIndex - 1
    if highestIndex < lowestIndex
      notFound numberToFind, acc
    else
      binarySearch(numbers, numberToFind, acc, lowestIndex, highestIndex)

notFound = (numberToFind, acc) ->
  console.log "#{numberToFind} not found in #{acc} attempts."
  -1

Algorithm = exports? and exports or @Algorithm = {}

class Algorithm.Search
  binarySearch: binarySearch
