# `Unit Testing for Arrays`
Unit testing functions to test for the equality or inequality of arrays, to within some specified precision.

<br/><br/> 
<br/><br/> 

# `TEST_EQUAL`

## Syntax

`TEST_EQUAL(actual,expected)`\
`TEST_EQUAL(actual,expected,max_err)`


## Description

`TEST_EQUAL(actual,expected)` determines if the actual result, `actual`, is equal to the expected result, `expected`. The two arrays are considered equal if their individual elements are equal to within <img src="https://latex.codecogs.com/svg.latex?\inline&space;10^{-15}" title=""/>.

`TEST_EQUAL(actual,expected,max_err)` determines if the actual result, `actual`, is equal to the expected result, `expected`. The two arrays are considered equal if their individual elements are equal to within a user-specified maximum error, `max_err`.

<br/><br/> 
<br/><br/> 


# `TEST_UNEQUAL`

## Syntax

`TEST_UNEQUAL(actual,expected)`\
`TEST_UNEQUAL(actual,expected,min_err)`


## Description

`TEST_UNEQUAL(actual,expected)` determines if the actual result, `actual`, is not equal to the expected result, `expected`. The two arrays are considered to not be equal if any of their individual elements differ by at least <img src="https://latex.codecogs.com/svg.latex?\inline&space;10^{-15}" title=""/>.

`TEST_UNEQUAL(actual,expected,min_err)` determines if the actual result, `actual`, is not equal to the expected result, `expected`. The two arrays are considered to not be equal if their individual elements differ by at least a user-specified minimum error, `min_err`.

<br/><br/> 
<br/><br/> 

## Examples

   -  See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples.
