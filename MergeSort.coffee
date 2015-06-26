
Merge = (array1, array2) ->
  arrayResult = new Array(array1.length + array2.length)
  arrayResult_cursor = 0
  array2_cursor = 0
  array1_cursor = 0
  while arrayResult_cursor < arrayResult.length
    while (array1[array1_cursor] >= array2[array2_cursor] or not array1[array1_cursor]?) and array2[array2_cursor]?
      arrayResult[arrayResult_cursor++] = array2[array2_cursor++]
    while (array2[array2_cursor] >= array1[array1_cursor] or not array2[array2_cursor]?) and array1[array1_cursor]?
      arrayResult[arrayResult_cursor++] = array1[array1_cursor++]
  arrayResult


MergeSort = (array, startIndex, endIndex) ->
  if startIndex >= endIndex
    return [array[startIndex]]
  else
    middle = Math.floor((endIndex + startIndex) / 2)
    return Merge MergeSort(array, startIndex, middle), MergeSort(array, middle + 1, endIndex)

exports.Merge = Merge
exports.MergeSort = MergeSort

if require.main is module
  # Is standalone module
  console.log "Merge Sorting"

  testsCount = 10
  testNo = 0
  while testNo++ < testsCount
    testArray = ((Math.random() - .5) * 1e9 for num in [0..Math.random() * 1e6])
    console.log "Test #{testNo}: Array of length #{testArray.length}"
    merged =  MergeSort testArray, 0, testArray.length - 1
    prevVal = -Infinity
    for val in merged
      if val < prevVal
        throw "Merge Sort failed test"
      prevVal = val

  console.log "Passed tests"

### Notes
I wrote this script from memory of the Merge Sort algorithm 
as described in my Algorithms Design Manual while on a flight
from KC, MO to San Diego. It  was a lot easier to write than
I anticipated, because I distinctly remember the `Merge`
function being kinda confusing until I heard it described like
a "zipper."
June 25, 2015
###