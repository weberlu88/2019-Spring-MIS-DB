CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_AddItem`(
	IN itemName varchar(512),
    IN itemPrice int,
    IN itemDescription tinytext,
    IN product_number char(8),
    IN stock int(4),
    OUT affected_row INT
)
BEGIN
-- input : itemName(varchar(512)), price(int), description(tinytext), product_number(char(8)), stock(int(4))
-- output parameter : Number of affected row(int)
-- 透過 sp_ AddItem，輸入商品名字,價格,商品描述,商品序號(非商品 ID)以及庫存數量，進行增加此商品。
-- 此題目描述只能新增項目，不能update數量

	INSERT INTO tblItem (ItemName, Price, ItemDescription, ProductNumber, isOffShelf)
	VALUES (itemName, itemPrice, itemDescription, product_number, 0);
    SET affected_row = row_count();
    
    INSERT INTO ItemStock (idItemStock, StockQuanity)
    VALUES (LAST_INSERT_ID(), stock);

END