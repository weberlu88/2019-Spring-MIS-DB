use db_forClass;

INSERT INTO tblUser (Email,FirstName,LastName,Dob,Salt,UUID,RegisterDateTime)
VALUES ('test2@ncu.edu.tw','George','Ke','2000-01-01',
'809F42E770A13C54EFE9854FCC7953E13B7072C6D594922C554708CAB1EC587F
',uuid(),now());

SET @last_id_in_tblUser = last_insert_id();
SET @hashedPwd = encrypt('password'+'809F42E770A13C54EFE9854FCC7953E13B7072C6D594922C554708CAB1EC587F');

INSERT INTO tblUserCredential (HashedPwd, CreateDateTime, UserID)
VALUES (@hashedPwd, now(), @last_id_in_tblUser);