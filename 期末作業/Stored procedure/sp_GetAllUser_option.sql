CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_GetAllUser_option`()
BEGIN

-- 不管有沒有delete都印出來
	SELECT * 
    FROM tblUser
    JOIN tblUserCredential
    WHERE(tblUser.idtblUser = tblUserCredential.UserID);

END