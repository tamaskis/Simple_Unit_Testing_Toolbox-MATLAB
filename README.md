# Unit Testing for Arrays [![View Unit Testing for Arrays on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/103095-unit-testing-for-arrays)
Simple unit testing functions for MATLAB.

<br/><br/> 

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