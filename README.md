# Simple Unit Testing Toolbox


# Functions

**Testing for array equality:**\
`TEST_EQUAL(actual,expected)`\
`TEST_EQUAL(actual,expected,max_err)`

<br/>

**Testing for array inequality:**\
`TEST_UNEQUAL(actual,expected)`\
`TEST_UNEQUAL(actual,expected,min_err)`

<br/>

**Testing for correct error handling:**\
`TEST_ERROR(f)`\
`TEST_ERROR(@function)`\
`TEST_ERROR(f,__)`\
`TEST_ERROR(@(__)function(__),__)`

<br/>

**Testing for successful function execution:**\
`TEST_NO_ERROR(f)`\
`TEST_NO_ERROR(@function)`\
`TEST_NO_ERROR(f,__)`\
`TEST_NO_ERROR(@(__)function(__),__)`