CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_PlaceOrderFromShoppingCart`(
	IN in_user_id int(11),
    IN in_city_id int(11),
    IN in_district_id int(11),
    IN in_addrLine varchar(100),
    OUT out_num_itemAdded int
)
BEGIN
-- input: user_id(int), city_id(int), district_id(int), AddrLine (varchar(100))
-- result set:無
-- output parameter:NumOfItemsAdded(int)
-- 透過 sp_ PlaceOrderFromShoppingCart，將購物車的商品做結帳。
-- 這裡我沒把此帳號的購物車清空! 庫存也沒有減少! 要在call SP自己刪除。

	DECLARE orderprice INT DEFAULT 0;
    DECLARE thisOrder_id INT;
    DECLARE n INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    DECLARE i_id INT DEFAULT 0;
    DECLARE i_qty INT DEFAULT 0;
    DECLARE i_price INT DEFAULT 0;
    DECLARE i_totalprice INT DEFAULT 0;
    
    DROP temporary table if exists tbl_toPay;
    CREATE TEMPORARY TABLE tbl_toPay
	(
        Col_id int(11) auto_increment primary key,
        Item_id int(11),
        Qty int(4),
        Price mediumint(6)
	)ENGINE = MEMORY;
    
    -- 抓出該user的ShoppingCart有哪些items
    INSERT INTO tbl_toPay (Item_id, Qty, Price)
	SELECT ItemID_Cart, Quanity_Cart, tblItem.Price
    FROM tblShoppingCart 
    JOIN tblItem
    ON (tblShoppingCart.ItemID_Cart = tblItem.idtlbItem)
	WHERE (UserID_Cart = in_user_id);
    
    -- 求得共幾項物品
    SELECT COUNT(*) FROM tbl_toPay INTO n;
    SET out_num_itemAdded = n;
    SELECT * from tbl_toPay;
	-- SELECT n;
    
    -- 計算單一物品的總價/訂單總價 >> loop
    SET i = 1;
    WHILE i <= n DO -- i = 1 ~ n 且會跟隨tbl_toPay的Col_id
		SELECT Qty, Price INTO i_qty, i_price from tbl_toPay WHERE (Col_id = i);
        SET i_totalprice = i_qty * i_price;
        SET orderprice = orderprice + i_totalprice;
		SET i = i + 1;
    END WHILE;
    
    -- 最後INSERT到tblOrder中 >> 單筆訂單
    INSERT INTO tblOrder (UserID, CreateDateTime, OrderTotal, Delivery_city, Delivery_district, Delivery_address_line)
    VALUES (in_user_id, now(), orderprice, in_city_id, in_district_id, in_addrLine);
    
    SET thisOrder_id = LAST_INSERT_ID();
    
    -- INSERT購買的商品(id qty 購買當時的price)到tblOrderItems >> 多筆用loop
	SET i = 1;
    WHILE i <= n DO -- i = 1 ~ n 且會跟隨tbl_toPay的Col_id
		SELECT Item_id, Qty, Price INTO i_id, i_qty, i_price from tbl_toPay WHERE (Col_id = i);
		INSERT INTO tblOrderItems (Order_id, Item_id, ItemQuanity, ItemPrice)
		VALUES (thisOrder_id, i_id, i_qty, i_price);
		SET i = i + 1;
    END WHILE;

	DROP temporary table if exists tbl_toPay;
    -- done
    
END