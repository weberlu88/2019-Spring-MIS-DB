CREATE DEFINER=`catcat`@`192.168.56.1` FUNCTION `fk_NumberOfNewRegistration`( in_month INT ) RETURNS int(11)
BEGIN

	DECLARE n int default 0;
    
    SELECT COUNT(distinct idtblUser) AS `new in` 
    INTO n
    FROM tblUser 
    WHERE ( month(RegisterDateTime) = in_month );

RETURN n;
END