CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_UserLogin`(
	IN in_Email VARCHAR(200)
    -- OUT out_HashedPwd VARCHAR(512)
    )
BEGIN
-- 透過 sp_UserLogin，輸入會員的電子信箱，可以獲得其使用者的電子信箱,姓氏,名字,生日,salt,UUID 以及註冊日期，進行會員登入。
-- https://pastebin.com/BtYg3GXN?fbclid=IwAR1o4XzVz5BIfrpMRKNMWBkCuhHISu7OVjEjxXNkv0RS9yJD-tOwQelNxI8
-- 已做驗證
    
    SELECT idtblUser, Email, FullName, Dob, Salt, UUID, RegisterDateTime
    FROM tblUser
    JOIN tblUserCredential ON (tblUser.idtblUser = tblUserCredential.UserID) -- id相同就join
    WHERE (Email = in_Email) AND (tblUser.isDeleted != 1); -- 比對in_email和未被刪除
    
END