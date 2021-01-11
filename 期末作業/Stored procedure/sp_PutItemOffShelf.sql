CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_PutItemOffShelf`(
	IN in_item_id int(11),
    OUT out_affected_row int
)
BEGIN
-- input: item_id (int)
-- result set:無
-- output parameter : Number of affected row(int)
-- 透過 sp_ PutItemOffShelf，輸入商品 ID，將商品下架。

	-- 把商品isOffShelf的值設為1
    UPDATE tblItem SET isOffShelf = 1   
    WHERE (idtlbItem = in_item_id AND isOffShelf = 0);
	-- 從所有含有此商品的購物車，刪除此商品(直接刪喔)
    DELETE FROM tblShoppingCart 
    WHERE (ItemID_Cart = in_item_id);
    
    SET out_affected_row = row_count();



END