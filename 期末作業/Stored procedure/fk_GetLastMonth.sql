CREATE DEFINER=`catcat`@`192.168.56.1` FUNCTION `fk_GetLastMonth`() RETURNS int(11)
BEGIN

	DECLARE result INT DEFAULT 0;
    SET result = month( now() );
    IF result = 1 THEN
		SET result = 12;
	ELSE 
		SET result = result - 1;
	END IF;

RETURN result;
END