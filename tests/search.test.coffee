Algorithm = require './../src/search'

exports.SearchTest =

setUp: (callback) ->
  @sut = new Algorithm.Search()
  callback()

'returns -1 when number not found in array of size 1': (test) ->
  inputArray = [12]
  result = @sut.binarySearch inputArray, 13
  expected = -1
  test.equal(result, expected)
  test.done()

'returns -1 when number not found in array after multiple attempts': (test) ->
  inputArray = [1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20]
  result = @sut.binarySearch inputArray, 13
  expected = -1
  test.equal(result, expected)
  test.done()

'can find number in an array of size 1 in 1 attempt': (test) ->
  inputArray = [12]
  result = @sut.binarySearch inputArray, 12
  expected = 1
  test.equal(result, expected)
  test.done()

'can find number in an array of size 2 in 1 attempt': (test) ->
  inputArray = [12,15]
  result = @sut.binarySearch inputArray, 12
  expected = 1
  test.equal(result, expected)
  test.done()

'can find number in a sorted array of mixed ascending numbers': (test) ->
  inputArray = [12,13,14,15,16,17,19,21,23,25]
  result = @sut.binarySearch inputArray, 19
  expected = 4
  test.equal(result, expected)
  test.done()

'can find number in a sorted array of the first 25 primes': (test) ->
  inputArray = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59,
   61, 67, 71, 73, 79, 83, 89, 97]
  result = @sut.binarySearch inputArray, 67
  expected = 2
  test.equal(result, expected)
  test.done()
