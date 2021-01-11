use db_forClass;

SET @email = 'test7@ncu.edu.tw';
SET @hashedPwd = '', @salt = '';

call sp_UserLogin(@email, @hashedPwd, @salt);

select @hashedPwd, @salt;