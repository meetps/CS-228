%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Name : Meet Pragnesh Shah 
% RollN : 13D070003
% Plagiarism Check : Yes | Not one line is copied or outsourced from someone
% Source of Learning Prolog : Learn Prolog Now (.pdf) and 99 Prolog Problems
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Program Begins Here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%double(X,[X,X]).			
double(X,[X|Y]) :- member(X,Y).			
double(X,[Z|Y]) :- double(X,Y).

twice(X,L) :- double(X,L) .


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second Program Begins Here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Power Function Defined to Raise powers of 2
pow(_,0,1).
  pow(B,E,R) :- E > 0,!, E1 is E -1, pow(B,E1,R1), R is B * R1.

%Base Cases
binvalue([0], 0).
binvalue([1],1).

% Recursion
binvalue([X|Y],A) :- binvalue(Y,B), length(Y,Q) , pow(2,Q,S) , A is B + X*S .




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third Program Begins Here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
is_prime(2). 
is_prime(3).
is_prime(P) :- integer(P), P > 3, P mod 2 =\= 0, \+ has_factor(P,3).
has_factor(N,L) :- N mod L =:= 0.
has_factor(N,L) :- L * L < N, L2 is L + 2, has_factor(N,L2).

factors(1,[1]).
factors(2,[1,2]).
factors(3,[1,3]).

add_list([], L, L).
add_list([H|T], L, L1) :- add(H, L2, L1), add_list(T, L, L2).


factors(N,[1|L]) :- for_start(2, N, L).
for_start(I,I,[I]).
for_start(I,N,Ans) :- I < N, I1 is I + 1, (N mod I =:= 0 ->  Ans = [I|L]; Ans = L), for_start(I1,N,L). 
