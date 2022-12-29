clear;clc;close all;
addpath(genpath('toolbox'));

%%

f_fast = @test_func_2;
f_slow = @test_func_1;

test_suite = TestSuite;
test_suite.add_test(TestSpeed(f_fast,f_slow,{},'testing'));

test_suite.run;

%%

function x = test_func_1
    x = 20;
end

function x = test_func_2
    x = sin(20)*tan(20)*atan(20)*acos(20)*asec(20);
end