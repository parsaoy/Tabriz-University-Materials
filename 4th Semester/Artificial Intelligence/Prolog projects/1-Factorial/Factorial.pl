% Project 3
%   Parsa Yousefi Nejad
factorial(0,1).
factorial(1,1).
% is N! == F ?
factorial(N,F):-
    N>1,
    M is N-1,
    factorial(M,W),
    F is N*W.