CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_GetCityList`()
BEGIN
	-- 透過 sp_GetCityList，可以獲得全部城市的 ID 以及名字。
	select idtblCity, CityName
    from tblCity;

END