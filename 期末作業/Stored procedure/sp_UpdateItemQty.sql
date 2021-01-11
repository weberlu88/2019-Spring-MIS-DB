CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_UpdateItemQty`(
	IN in_ProductNumber int(11),
    IN in_Qty int(4),
    OUT affected_row INT
)
BEGIN
-- 要加多少數量

	DECLARE item_id INT;
	SELECT idtlbItem INTO item_id 
    FROM tblItem 
    WHERE (ProductNumber = in_ProductNumber);

	UPDATE ItemStock
    SET StockQuanity = StockQuanity + in_Qty
    WHERE (item_id = idItemStock);

END