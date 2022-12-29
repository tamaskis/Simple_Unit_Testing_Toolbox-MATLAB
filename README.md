# Simple Unit Testing Toolbox

## Test Suites

### Creating a test suite.

`test_suite = TestSuite(name,terminate)`


### Adding tests to a test suite.

`test_suite.add_test(TestEqual(X1,X2,name,n))`\
`test_suite.add_test(TestNotEqual(X1,X2,name,n))`\
`test_suite.add_test(TestError(f,args,name))`\
`test_suite.add_test(TestNoError(f,args,name))`\
`test_suite.add_test(TestSpeed(f1,f2,args,name))`

### Running a test suite.

`test_suite.run`


## Individual Unit Testing Functions


### Testing for array equality/inequality.

`TEST_EQUAL(X1,X2,n)`\
`TEST_NOT_EQUAL(X1,X2,n)`

<br/>

### Testing for correct error handling.
`TEST_ERROR(f,args)`\
`TEST_NO_ERROR(f,args)`

<br/>

### Testing speed.
`TEST_SPEED(f_fast,f_slow,args,n_eval)`\
`TIME_OPERATION(f,args,n_eval)`