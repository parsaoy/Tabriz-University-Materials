min(X, [X|[]]):-!.
min(MIN, [X,Y|T]):-
    X>=Y,!,
    min(MIN,[Y|T]).

min(MIN, [X,Y|T]):-
    % X<Y,
    min(MIN,[X|T]).

% ///////////////////////////////////

max(X, [X]):-!.
max(MAX, [X,Y|T]):-    X>=Y,!,    max(MAX,[X|T]).
max(MAX, [X,Y|T]):-    max(MAX,[Y|T]).


% del(X,L1,L2).
del(_,[],[]):-!.
del(X,[X|T],L3):- del(X,T,L3),!. % removes all Xs
% del(X,[X|T],L3):-!. remove one occurence version 
del(X,[H|T],L2):-del(X,T,L3),L2 = [H|L3].
% del(X,[H|T],[H|L3]):- del(X,T,L3).

remove_duplicates([], []).
remove_duplicates([H|T], L) :- member(H, T), !, remove_duplicates(T, L).
remove_duplicates([H|T], [H|T1]) :- remove_duplicates(T, T1).


% isSorted(L1).

isSorted([]):- !.
% isSorted([Head1,Head2|[]]):- Head1=<Head2,!.
isSorted([Head1,Head2|T]):- Head1=<Head2 , isSorted([Head2|T]).


len1(0,[]):-!.
len1(X,[_|Tail1]):- len1(W,Tail1), X is W+1.

% append(L1, L2, L3).
% = concat
append([], L2, L3):-L3 = L2.
append([H|T],L2, [H|L3]):- append(T,L2,L3).


reverse_list([],[]).
reverse_list([Head|Tail], ReversedList):-
    reverse_list(Tail,ReversedList1),
    append(ReversedList1, [Head], ReversedList).


% split(L1,P,Left, Right).
% Duplicated, same implementaion as partition rule
% split([],_,[],[]):-!.
% split([H|T],P,[H|Left],Right):-
%     H<P,
%     split(T,P,Left,Right).
% split([H|T],P,Left,[H|Right]):-
%     H>=P,
%     split(T,P,Left,Right).

% Universal Fact
removeLast([_],[]).
% Rule
removeLast([H|T],List):-
    removeLast(T,L3),
    List = [H|L3].

sum([],0).
sum([H|T],X):-
    sum(T,W),
    X is H + W.

counter(_,[],0).
counter(X,[X|T],C):-
    % X == H,!,
    counter(X,T,W),
    C is W+1.
counter(X,[_|T],C):-
    counter(X,T,C).

equal([], []):-!.
equal([H1|T1], [H2|T2]) :- H1 == H2, equal(T1,T2).

% min(X,[]).
% min(X,[H1,H2|T]):- H1=<H2,!,min(X,[H1,T]).
% min(X,[H1,H2|T]):- min(X,[H2,T]).

% isSorted([]):-!.
% isSorted([H1,H2|T]):-H1=<H2,!, isSorted(H2,T).
deleteFirst([],[]):-!.
deleteFirst([_|T],T).

quickSort([],[]):-!.
quickSort([H|T],Sorted):-
    partition(H,T,Left,Right),
    quickSort(Left,LSorted),
    quickSort(Right,RSorted),
    append(LSorted, [H|RSorted], Sorted).

partition(_,[],[],[]):-!.
partition(Pivot, [H|T], [H|L], R) :- H =< Pivot, partition(Pivot, T, L, R). % ,!,
partition(Pivot, [H|T], L, [H|R]) :- H > Pivot, partition(Pivot, T, L, R).

average([],0):-!.
average(List,X):- sum(List,S), len1(List,L), X is S/L.

% insertAt(Element, Index, List, Result).

% insertAt(X,_,[],L1):- L1 = [X|[]].
insertAt(X,1,L,[X|L]):-!.
insertAt(E,I,[H|T], [H|T1]):- I >= 2, I2 is I-1, insertAt(E,I2,T,T1).


split_at(N, List, First, Second) :- len1(First, N), append(First, Second, List).

sumSeries(1,1):-!.
sumSeries(N,SUM):- N>1, N2 is N-1 ,sumSeries(N2,SUM2), SUM is SUM2 + N.


sumDigits(0,0):-!.
sumDigits(X,SUM):- Each is X mod 10, X2 is X//10, sumDigits(X2,SUM2), SUM is Each + SUM2. 

findElement(X,[X|T],1):-!.
findElement(X,[H|T],I):-findElement(X,T,I1),I is I1+1.

% subtract method for division
divide(0,_,0):-!.
divide(X,Y,Result):- X >=1 , Y>=1 , X1 is X-Y, divide(X1,Y,R2), Result is R2+1.

% findDuplicate(List, X).
findDuplicate([H|T],H):- member(H,T),!.
findDuplicate([H|T],X):- findDuplicate(T,X).

% member(X, List).
member(X, [X|[]]):-!.
member(X,[H|T]):- member(X,T).


% mergeSort(L1,Sorted)?

mergeSort([],[]).
mergeSort([X],[X]).
mergeSort(List,Sorted):-
    length(List, Len),
    Len > 1,
    split(List, Left, Right),
    mergeSort(Left, LeftSorted),
    mergeSort(Right, RightSorted),
    merge(LeftSorted, RightSorted, Sorted).

split(List, Left, Right):-
    myLen(List, Len),
    HalfLen is Len // 2,
    myLen(Left, HalfLen),
    append(Left, Right, List).

% #############
merge([],L2,L2).
merge(L1,[],L1).
merge([H1|T1],[H2|T2],[H1|L3]):-
    H1=<H2,
    merge(T1,[H2|T2],L3).

merge([H1|T1],[H2|T2],[H2|L3]):-
    H2 > H1,
    merge([H1|T1],T2,L3).
% #############

% myLen(List, Len)?

myLen([],0).
myLen([_|T],Len):-
    myLen(T,W),
    Len is W+1.

    

% split(List, Left, Right) :-
%     length(List, Len),
%     HalfLen is Len // 2,
%     length(Left, HalfLen),
%     append(Left, Right, List).

% split(List, Left, Right):-
%     myLen(List, Len),
%     HalfLen is Len // 2,
%     myLen(Left, HalfLen),
%     append(Left, Right, List).

merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, Sorted) :-
    length(List, Len),
    Len > 1,
    split(List, Left, Right),
    merge_sort(Left, SortedLeft),
    merge_sort(Right, SortedRight),
    merge(SortedLeft, SortedRight, Sorted).

split(List, Left, Right) :-
    length(List, Len),
    HalfLen is Len // 2,
    length(Left, HalfLen),
    append(Left, Right, List).

merge([], Right, Right).
merge(Left, [], Left).
merge([L|Left], [R|Right], [L|Sorted]) :-
    L =< R,
    merge(Left, [R|Right], Sorted).
merge([L|Left], [R|Right], [R|Sorted]) :-
    L > R,
    merge([L|Left], Right, Sorted).