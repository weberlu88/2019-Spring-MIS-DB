use db_forClass;

SET @email = 'test7@ncu.edu.tw';
SET @firstName = 'Posey';
SET @lastName = 'Jackson';
SET @dob = '1990-01-01';
SET @salt = '640BCE948BA0EDCD29B353D0344FBC7E43594222D448BE55616770F20A542D75';
SET @hashedPwd = encrypt('test'+'123');

call sp_RegisterUser(@email, @firstName, @lastName, @dob, @salt, @hashedPwd);