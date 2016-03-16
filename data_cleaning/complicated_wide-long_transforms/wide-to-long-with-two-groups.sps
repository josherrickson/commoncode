* Data currently looks like
* ID MomTimeofDay DadTimeofDay MomCort1 MomCort2 MomCort3 DadCort1 DadCort2 DadCort3
* 101       11:00        16:45      5.4      6.0      5.8      7.3      7.9      8.0


COMPUTE momtime1=MomTimeOfDay.
COMPUTE momtime2=MomTimeOfDay.
COMPUTE momtime3=MomTimeOfDay.
COMPUTE dadtime1=DadTimeOfDay.
COMPUTE dadtime2=DadTimeOfDay.
COMPUTE dadtime3=DadTimeOfDay.
EXECUTE.

FORMATS momtime1(Time5) momtime2(Time5) momtime3(Time5) dadtime1(Time5) dadtime2(Time5) dadtime3(Time5).

DELETE VARIABLES MomTimeOfDay DadTimeOfDay.

VARSTOCASES
 /MAKE TimeOfDay FROM momtime1 TO dadtime3
 /MAKE CORT FROM MomCort1 TO DadCort3
 /INDEX = Parent.
LIST.

COMPUTE Time = Parent.
IF  (Parent > 3) Time=Parent - 3.
RECODE Parent (1 thru 3=1) (4 thru 6=2).
EXECUTE.

* Data now looks like:
* ID   Parent   TimeofDay      Time     CORT
* 101       1       11:00         1      5.4
* 101       1       11:00         2      6.0
* 101       1       11:00         3      5.8
* 101       2       16:45         1      7.3
* 101       2       16:45         2      7.9
* 101       2       16:45         3      8.0
