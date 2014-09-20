%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Various sorting algorithms in SW Prolog - Siva- sep 6, 2012

% Insertion sort first-   isort
%   Assumes first argument is unsorted list and gives ascending order
%   Cannot be called with first arg as variable.
isort([],[]).
isort([F|R],Ans) :- isort(R, A1), sortedIns(F, A1, Ans).

sortedIns(N,[],[N]).
sortedIns(N,[F|R],[N | [F | R]]) :- N < F.
sortedIns(N,[F|R], [F|Ans]) :- N >=F, sortedIns(N, R, Ans).

% Quick sort next - ascending order   qsort
%   Assumes first argument is unsorted list and gives ascending order
%   Cannot be called with first arg as variable.

qsort([],[]).
qsort([F|R],Ans) :- prtn(F,R,Sm,Big), qsort(Sm, L1), qsort(Big, L2),
                    append(L1, [F|L2], Ans).

prtn(N,[],[],[]).
prtn(N,[F|R],[F|A1],A2) :- F < N, prtn(N,R,A1,A2).
prtn(N,[F|R],A1,[F | A2]) :- F >= N, prtn(N,R,A1,A2).

%% Merge sort   msort
msort([],[]).
msort([N],[N]).
msort([F| [S |R]],Ans) :- splt([F| [S | R]],L1,L2),
                          msort(L1,A1), msort(L2,A2), mrge(A1,A2,Ans).

mrge([],L2,L2).
mrge([A|R1],[], [A|R1]).
mrge([A|R1],[B|R2],[A|Ans]) :- A < B, mrge(R1,[B|R2],Ans).
mrge([A|R1],[B|R2],[B|Ans]) :- A >= B, mrge([A | R1], R2, Ans).

splt([],[],[]).
splt([N],[N],[]).
splt([A | [B | R]], [A | L1], [B | L2]) :- splt(R, L1, L2).

% try goals like   isort([1,4,3,2],Ans).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%