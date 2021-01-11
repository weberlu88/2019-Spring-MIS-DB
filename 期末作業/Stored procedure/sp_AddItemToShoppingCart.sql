CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_AddItemToShoppingCart`(
	IN in_user_id int(11),
    IN in_item_id int(11),
    IN in_itemQty int(4),
    OUT out_affected_row INT
)
BEGIN
-- input: user_id(int(11)), item_id (int(11)) , itemQty(int(4))
-- result set:無
-- output parameter : Number of affected row(int)
-- 透過 sp_ AddItemToShoppingCart，輸入會員 ID,商品 ID 以及會員要買此商品的數量，將此商品加入到會員的購物車。
	
    DECLARE init_qty INT(4);
    DECLARE stock_qty INT(4);
    DECLARE item_isOffShelf tinyint(1);
    SET out_affected_row = 0;
    
    -- get stock_qty of item
    SELECT StockQuanity INTO stock_qty FROM ItemStock WHERE (idItemStock = in_item_id);
	SELECT isOffShelf INTO item_isOffShelf FROM tblItem WHERE (idtlbItem = in_item_id);
    
	-- 數量不為0 且存貨要夠 且沒有被下架 
    IF (in_itemQty != 0 AND stock_qty >= in_itemQty AND item_isOffShelf != 1) THEN
        
		-- SELECT init_qty := Quanity_Cart FROM tblShoppingCart WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
		SELECT Quanity_Cart INTO init_qty FROM tblShoppingCart WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
		IF (init_qty is NULL OR init_qty = 0) THEN
			-- 此項目沒加入過購物車 => INSERT
			INSERT INTO tblShoppingCart (UserID_Cart, ItemID_Cart, Quanity_Cart)
			VALUES (in_user_id, in_item_id, in_itemQty);
            SET out_affected_row = row_count();
            SELECT in_user_id;
		END IF;

    END IF;
        
    

END