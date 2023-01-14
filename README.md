# Simple Unit Testing Toolbox [![View Simple Unit Testing Toolbox on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/122777-simple-unit-testing-toolbox)

This toolbox defines a simple unit testing framework for MATLAB.

## Installation

1. Download the toolbox from [File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/122777-simple-unit-testing-toolbox) or [GitHub](https://github.com/tamaskis/Simple_Unit_Testing_Toolbox-MATLAB).
2. Open the `INSTALL` folder.
3. Double-click on `Simple Unit Testing Toolbox.mltbx`.

MATLAB will automatically perform the installation and add all the contents of the `toolbox` folder to the MATLAB search path.

## Documentation

[Toolbox Documentation](https://tamaskis.github.io/Simple_Unit_Testing_Toolbox-MATLAB)

To open the home page of the toolbox documentation in MATLAB, type the following in the Command Window:

```
doc_SUTT
```

To open the documentation of a specific function or class with name `name`, type the following in the Command Window:

```
doc_SUTT name
```

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

### Testing for correct error handling.
`TEST_ERROR(f,args)`\
`TEST_NO_ERROR(f,args)`

### Testing speed.
`TEST_SPEED(f_fast,f_slow,args,n_eval)`\
`TIME_EVALUATION(f,args,n_eval)`


## Printing to Command Window

Note that in the examples in the documentation, all of the test output is in black. However, when you run the tests locally in MATLAB, passed tests will print in green, while failed tests will print in red; this is accomplished using the [cprintf](https://www.mathworks.com/matlabcentral/fileexchange/24093-cprintf-display-formatted-colored-text-in-command-window) function.