CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_UpdateItemQtyInShoppingCart`(
	IN in_user_id int(11),
    IN in_item_id int(11),
    IN in_itemQty int(4),
    OUT out_affected_row int
)
BEGIN
-- input: user_id(int), item_id(int), itemQty(int)
-- result set:無
-- output parameter : Number of affected row(int)
-- 透過 sp_ UpdateItemQtyInShoppingCart，輸入會員 ID,商品 ID 以及此商品的購買數量，進行修改會員購物車中的商品數量。

	DECLARE init_qty INT(4);
    DECLARE stock_qty INT(4);
    SET out_affected_row = 0;
    
    -- get stock_qty of Item / init_qty in Cart
    SELECT StockQuanity INTO stock_qty FROM ItemStock WHERE (idItemStock = in_item_id);
    SELECT Quanity_Cart INTO init_qty FROM tblShoppingCart WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
    
    -- 數量不為0且存貨要夠
    IF (in_itemQty != 0 AND stock_qty >= in_itemQty) THEN
    
        IF init_qty is NOT NULL THEN
		-- 已經在購物車裡 => UPDATE加上去
		UPDATE tblShoppingCart
		SET Quanity_Cart = in_itemQty + init_qty
		WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
        SET out_affected_row = row_count();
        
		END IF;
    
    END IF;
    
END