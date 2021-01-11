CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_DeleteUserByUserID`(
	in in_user_id INT,
    out out_affected_row INT
)
BEGIN
-- 透過 sp_ DeleteUserByUserID，輸入會員 ID，進行刪除此會員。
-- output parameter: Number of affected row(int)

	-- DECLARE id_delete INT; -- 多此一舉
	-- SET id_delete = (SELECT isDeleted FROM tblUser WHERE idtblUser = in_user_id);
    
    -- 刪除User >> 修改 isDeleted = 1
	UPDATE tblUser
    SET isDeleted = 1
    WHERE (idtblUser = in_user_id) AND (isDeleted = 0);
    
    SET out_affected_row = row_count();
    
    -- 刪除id在tblShoppingCart和tblWishList的東西 >> 修改 isDeleted = 1
    UPDATE tblShoppingCart
	SET isDeleted = 1
	WHERE (UserID_Cart = in_user_id);
    UPDATE tblWishList
	SET isDeleted = 1
	WHERE (UserID_Wish = in_user_id);
    
END