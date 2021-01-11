use db_Weber_finalHW;

-- call sp_GetCityList(); -- 1.透過 sp_GetCityList，可以獲得全部城市的 ID 以及名字。

-- call sp_GetDistrictByCityID(10); -- 2.透過 sp_GetDistrictByCityID，輸入城市 ID，可以獲得此城市的 ID，還有其街區 ID 與街區名字。

-- SET @email = 'test1@ncu.edu.tw'; -- 3.透過 sp_RegisterUser，輸入會員的信箱,姓氏,名字,生日,salt 以及加密後的 password，進行會員註冊。
-- SET @firstName = 'Posey';
-- SET @lastName = 'Jackson';
-- SET @dob = '1890-12-01';
-- SET @salt = '640BCE948BA0EDCD29B353D0344FBC7E43594222D448BE55616770F20A542D75';
-- SET @hashedPwd = encrypt('testpwd'+'640BCE948BA0EDCD29B353D0344FBC7E43594222D448BE55616770F20A542D75');
-- call sp_RegisterUser(@email, @firstName, @lastName, @dob, @salt, @hashedPwd);
-- call sp_GetAllUser_option();

-- call sp_UserLogin('test1@ncu.edu.tw'); -- 4.sp_UserLogin

-- 5.sp_DeleteUserByUserID
SET @id_toDelete = 1, @affectedRow = 0;
-- call sp_DeleteUserByUserID(@id_toDelete, @affectedRow); 
-- SELECT @id_toDelete, @affectedRow;

-- 6.sp_AddItem
-- SET @itemName = 'Asus VivoBook s140ua', @price = 19999, @description = 'so good', @product_num = '1072012', @stock = 878;
-- call sp_AddItem(@itemName, @price, @description, @product_num, @stock, @affectedRow); -- 6.sp_AddItem
-- SELECT @affectedRow;

-- 7.sp_AddItemToShoppingCart
-- SET @user_id = 88, @item_id = 1, @qty = 10;
-- call sp_AddItemToShoppingCart(@user_id, @item_id, @qty, @affectedRow);
-- SELECT @affectedRow;

-- 8.sp_GetUserShoppingCart
-- call sp_GetUserShoppingCart(100);

-- 9.sp_RemoveItemFromShoppingCart
-- call sp_RemoveItemFromShoppingCart(1, 11, @affectedRow);
-- SELECT @affectedRow;

-- 10.sp_UpdateItemQtyInShoppingCart
-- SET @user_id = 2, @item_id = 11, @qty = 1;
-- call sp_UpdateItemQtyInShoppingCart(@user_id, @item_id, @qty, @affectedRow);
-- SELECT @affectedRow;

-- 11.sp_PlaceOrderFromShoppingCart 加分題
-- SET @numAdded = 0;
-- call sp_PlaceOrderFromShoppingCart(1, 1, 100, '全家', @numAdded);

-- 12.sp_PutItemOffShelf
-- SET @itemid_toDel = 11;
-- call sp_PutItemOffShelf(@itemid_toDel, @affectedRow);
-- SELECT @affectedRow;

-- SELECT * FROM view_Monthly_report;

-- SELECT SUM(OrderTotal) AS `Revenue`, 
-- 	SUM(OrderTotal)/COUNT(idtlbOrder) AS `Average spending per order`,
--    TopThreePopularItemsBought() AS `Top 3 popular items bought`,
-- 	fk_NumberOfNewRegistration(6) AS `Number of new registration`
-- FROM tblOrder;
 
-- SELECT COUNT(Order_id) AS `count`, Item_id FROM tblOrderItems GROUP BY Item_id order by COUNT(Order_id) desc;
-- SELECT fk_NumberOfNewRegistration( fk_GetLastMonth() +1 );
