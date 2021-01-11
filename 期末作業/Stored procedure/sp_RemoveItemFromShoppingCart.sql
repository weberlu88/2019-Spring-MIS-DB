CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_RemoveItemFromShoppingCart`(
	IN in_user_id int(11),
    IN in_item_id int(11),
    OUT out_affected_row int
)
BEGIN
-- input: user_id(int), item_id(int)
-- result set:無
-- output parameter : Number of affected row(int)
-- 透過 sp_ RemoveItemFromShoppingCart，輸入會員 ID 以及商品 ID，可以刪除會員購物車中的商品。

    DELETE FROM tblShoppingCart WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
    SET out_affected_row = row_count();
    
END