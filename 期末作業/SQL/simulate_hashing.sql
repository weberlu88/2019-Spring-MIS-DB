select encrypt('password'+random_byte(10)) as hash;

-- 不應該在資料庫做hash，應該要在web server做。這裡是模擬。