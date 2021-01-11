CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_GetUserShoppingCart`(
	IN in_user_id int(11)
)
BEGIN
-- input: user_id (int)
-- result set: 自行選擇
-- output parameter :無
-- 透過 sp_ GetUserShoppingCart，輸入會員 ID，可以獲得會員 ID 以及會員購物車中的商品ID 與商品數量。

	SELECT * FROM tblShoppingCart
    WHERE (UserID_Cart = in_user_id);

END