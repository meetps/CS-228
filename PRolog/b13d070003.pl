% Name - Meet PRagnesh Shah
% Roll - 13D070003

%gcd code begins

%to find the element at the nth place in a list.
element_at(X,[X|_],1).
element_at(X,[_|L],K) :- K > 1, K1 is K - 1, element_at(X,L,K1).

%to find the gcd of 2 numbers
gcd2(X,0,X) :- X > 0.
gcd2(X,Y,G) :- Y > 0, Z is X mod Y, gcd2(Y,Z,G).

gcd([1|T],1). % base case
gcd(S,Ans) :- element_at(A,S,1), element_at(B,S,2), gcd2(A,B,Ans).


%smForm Code begins

%function to pack the duplicate elements of a list into groups (lists)
pack([],[]).
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).

%function to transfer similar elements to their positions in the list(the outer list.)
transfer(X,[],[],[X]).
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).


%SPECIAL COMMENT - Due to some problem in the msort the smForm is not giving proper results
% pls try msort([1,2,3,4,5,6,6,1,8,9,9,1,2,4,5],Ans) 
% the Answer somehow comes to be Ans = [1, 1, 1, 2, 2, 3, 4, 4, 5|...].
% the ... in the end causes trouble and hence the elements are not sorted properly.
smForm(L1,L2) :- pack(L1,L), msort(L,L3) , transform(L3,L2).

%function to transform the lists containing the repeated elements to the lust having frequency and the element.
transform([],[]).
transform([[X|Xs]|Ys],[[X,N]|Zs]) :- length([X|Xs],N), transform(Ys,Zs).
%smForm(L,Ans). 

%botN code begins

%botN()