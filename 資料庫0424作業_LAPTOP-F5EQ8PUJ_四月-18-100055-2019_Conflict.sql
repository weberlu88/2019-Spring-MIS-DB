/*第1題*/
SELECT P# 
FROM Visits 
WHERE VDATE = '3-5-88' AND D# = 1

/*第2題*/
SELECT P# FROM Patient
WHERE P_ADDR NOT IN('Gosforth')
/*WHERE  P_ADDR != Gosforth
   WHERE  P_ADDR <> Gosforth*/ 
   
/*第3題*/
SELECT P#
FROM Visits NATURAL JOIN Doctor
WHERE D_NAME = 'Smith' AND VDATE = '3-5-88' /*或*/
SELECT P#
FROM Visits
WHERE VDATE = '3-5-88' AND D# = (SELECT D# FROM Doctor WHERE D_NAME = 'Smith')

/*第4題*/
SELECT P_NAME, P_ADDR
FROM Patient NATURAL JOIN Visits
					  NATURAL JOIN Doctor
WHERE D_NAME = 'Smith' AND V_DATE ='3-5-88'

/*第5題*/
SELECT MEDICINE
FROM Prescriptions NATURAL JOIN Patient
WHERE P_NAME = 'Giles'