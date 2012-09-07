:- include('data/line1.pl').

goes_to(From, To, Path, Duration) :-
	travel(From, To, [From], AccPath, Duration),
	reverse(AccPath, Path).

travel(From, To, PathSoFar, [To|PathSoFar], Time) :-
	connects(From, To, Time).

travel(From, To, PathSoFar, Path, Time) :-
	connects(From, NextStation, TravelTime),
	NextStation \== To,
	\+member(NextStation, PathSoFar),
	travel(NextStation, To, [NextStation|PathSoFar], Path, AccTime),
	Time is TravelTime + AccTime.
