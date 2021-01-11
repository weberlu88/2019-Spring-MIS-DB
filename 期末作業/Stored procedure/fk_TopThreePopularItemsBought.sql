CREATE DEFINER=`catcat`@`192.168.56.1` FUNCTION `fk_TopThreePopularItemsBought`(
) RETURNS varchar(50) CHARSET utf8
BEGIN
	-- 沒辦法篩月分了

	DECLARE outputString varchar(50);
	SELECT group_concat(Item_id) 
    INTO outputString 
    FROM (
		SELECT COUNT(Order_id) AS `count`, Item_id 
		FROM tblOrderItems
		GROUP BY Item_id
		ORDER BY COUNT(Order_id) desc 
		LIMIT 3
	) tblItemCount;

RETURN outputString;
END