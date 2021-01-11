CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_RegisterUser`(
	in in_Email varchar(200),
    in in_FirstName varchar(100),
    in in_LastName varchar(100),
    in in_DOB DATE,
    in in_Salt char(64),
    in in_HashedPwd varchar(512)
)
BEGIN

	INSERT INTO tblUser(Email, FirstName, LastName, DOB, Salt, UUID, RegisterDateTime)
	VALUES(in_Email, in_FirstName, in_LastName, in_DOB, in_Salt, uuid(), now());

	SET @last_insert_id = LAST_INSERT_ID();

	INSERT INTO tblUserCredential(HashedPwd, CreateDateTime, UserID)
	VALUES(in_HashedPwd, now(), @last_insert_id);
    
END