% Project 5: Family Relationships
%    Coded By Parsa Yousefi nejad

% Main Facts:
% *************************
male(sorena).
male(arvin).
male(mahyar).
male(radvin).
male(shayan).
male(farhad).
male(milad).
male(mehran).
male(parham).
male(kian).

female(baran).
female(delaram).
female(bahar).
female(raha).
female(delasa).
female(nafas).
female(yasamin).
female(negar).
female(shahrzad).
female(giso).
female(sara).

father(sorena,delaram).
father(arvin,mahyar).
father(arvin,radvin).
father(arvin,delasa).
father(arvin,nafas).
father(shayan,negar).
father(shayan,milad).
father(shayan,yasamin).
father(radvin,shahrzad).
father(radvin,mehran).
father(mahyar,giso).
father(mahyar,parham).
father(farhad,kian).
father(farhad,sara).

mother(baran,delaram).
mother(delaram,mahyar).
mother(delaram,radvin).
mother(delaram,delasa).
mother(delaram,nafas).
mother(delasa,negar).
mother(delasa,milad).
mother(delasa,yasamin).
mother(raha,shahrzad).
mother(raha,mehran).
mother(bahar,giso).
mother(bahar,parham).
mother(nafas,kian).
mother(nafas,sara).

% Relationship Rules:
% *************************
% X is parent of Y, iff X is either mother of Y, or father of Y.
parent(X,Y):-
    mother(X,Y);
    father(X,Y).
% X is grandmother of Y, iff X is female and there exists such a Z that X is mother of it and also Z be a parent of Y.
grandmother(X,Y):-
    % female(X),
    mother(X,Z),
    parent(Z,Y).
% X is grandfather of Y, iff X is male and there exists such a Z that X is father of it and also Z be a parent of Y.
grandfather(X,Y):-
    % male(X),
    father(X,Z),
    parent(Z,Y).
% X is sister of Y, iff X is female and moreover there exists such a person(W) that is mother of both X and Y, and considering X != Y.
sister(X,Y):-
    female(X),
    mother(W,X),
    mother(W,Y),
    X\==Y.
% X is brother of Y, iff X is male and moreover there exists such a person(W) that is parent of both X and Y, and considering X != Y.
brother(X,Y):-
    male(X),
    parent(W,X),
    parent(W,Y),
    X\==Y.
% X is khale of Y, iff X is female and there be a person called W, that is mother of Y, and X is sister of it.
khale(X,Y):-
    female(X),
    mother(W,Y),
    sister(X,W).
% X is amo of Y, iff X is male and there be a person called W, that is father of Y, and X is brother of it.
amo(X,Y):-
    male(X),
    father(W,Y),
    brother(X,W).
% X is dayi of Y, iff X is a male, and there be a W, who is mother of Y and X is her brother.
dayi(X,Y):-
    male(X),
    mother(W,Y),
    brother(X,W).

% X is ame for Y, iff such a W exists that is a father of Y and also X is sister of W.
ame(X,Y):-
    female(X),
    father(W,Y),
    sister(X,W).
% X is dokhtrakhale of X, iff X is a female and there be a W, who is khale of Y and also mother of X.
dokhtarkhale(X,Y):-
    female(X),
    khale(W,Y),
    mother(W,X).
% X is pesarkhale of X, iff X is a male and there be a W, who is khale of Y and also mother of X.
pesarkhale(X,Y):-
    male(X),
    khale(W,Y),
    mother(W,X).
% X is dokhtardayi of X, iff X is a female and there be such a W, who is dayi of Y and also father of X.
dokhtardayi(X,Y):-
    female(X),
    dayi(W,Y),
    father(W,X).
% X is pesardayi of X, iff X is a male and there be such a W, who is dayi of Y and also father of X.
pesardayi(X,Y):-
    male(X),
    dayi(W,Y),
    father(W,X).
% X is dokhtarame of Y, iff X is a female, and such a W exists who is ame of Y, and mother for X.
dokhtarame(X,Y):-
    female(X),
    ame(W,Y),
    mother(W,X).
% X is pesarame of Y, iff X is a male, and such a W exists who is ame of Y, and mother for X.
pesarame(X,Y):-
    male(X),
    ame(W,Y),
    mother(W,X).

% test case example Queries:
    /* 
        ?-  dokhtarkhale(X,Y).
        ?-  pesardayi(X,sara).
        ?-  khale(X,negar).
        ?-  amo(radvin,giso).
        ?-  parent(X,giso).
        ?-  parent(arvin,X).
        ?-  sister(X,Y).
        ?-  
     */
% ‌By Parsa Yousefi Nejad