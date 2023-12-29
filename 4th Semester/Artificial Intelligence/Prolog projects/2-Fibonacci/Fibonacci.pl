% Project 4
% Parsa Yousefi Nejadk
% Fibonacci series
fib(1,0).
fib(2,1).

% calculates Nth-Fibonacci number which must equals to F to return true
fib(N,F):-
    N>=3,
    N1 is N-1,
    N2 is N-2,
    fib(N1,F1),
    fib(N2,F2),
    F is F1 + F2.   

% produces first N number of Fibonacci series, and then prints them
producefib(N):-
    N>=1,
    fib(N,Answer),
    format('~w ',[Answer]),
    M is N-1,
    producefib(M).

%  N =: 1, 2, 3, 4, 5, 6, 7,  8,  9, 10, 11, 12,  13,...
%  F =: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144,...