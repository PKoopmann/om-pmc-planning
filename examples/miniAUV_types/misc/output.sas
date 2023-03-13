begin_version
3
end_version
begin_metric
0
end_metric
6
begin_variable
var0
0
2
Atom kbquery_candrive(remaroauv)
NegatedAtom kbquery_candrive(remaroauv)
end_variable
begin_variable
var1
-1
2
Atom candrive(backthruster)
NegatedAtom candrive(backthruster)
end_variable
begin_variable
var2
-1
3
Atom at(remaroauv, endpoint)
Atom at(remaroauv, photopoint)
Atom at(remaroauv, startpoint)
end_variable
begin_variable
var3
-1
2
Atom cantakepicture(rgbcamera)
NegatedAtom cantakepicture(rgbcamera)
end_variable
begin_variable
var4
0
2
Atom kbquery_cantakepicture(remaroauv)
NegatedAtom kbquery_cantakepicture(remaroauv)
end_variable
begin_variable
var5
-1
2
Atom hasphoto(photopoint)
NegatedAtom hasphoto(photopoint)
end_variable
0
begin_state
1
0
2
0
1
1
end_state
begin_goal
2
2 0
5 0
end_goal
7
begin_operator
drive remaroauv endpoint photopoint backthruster rgbcamera
1
0 0
1
0 2 0 1
1
end_operator
begin_operator
drive remaroauv endpoint startpoint backthruster rgbcamera
1
0 0
1
0 2 0 2
1
end_operator
begin_operator
drive remaroauv photopoint endpoint backthruster rgbcamera
2
2 1
0 0
1
0 1 -1 1
1
end_operator
begin_operator
drive remaroauv photopoint startpoint backthruster rgbcamera
1
0 0
1
0 2 1 2
1
end_operator
begin_operator
drive remaroauv startpoint endpoint backthruster rgbcamera
1
0 0
1
0 2 2 0
1
end_operator
begin_operator
drive remaroauv startpoint photopoint backthruster rgbcamera
1
0 0
2
0 2 2 1
0 3 -1 1
1
end_operator
begin_operator
take-photo remaroauv photopoint
2
2 1
4 0
1
0 5 -1 0
1
end_operator
2
begin_rule
1
1 0
0 1 0
end_rule
begin_rule
1
3 0
4 1 0
end_rule
