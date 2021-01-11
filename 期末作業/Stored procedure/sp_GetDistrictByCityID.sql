CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_GetDistrictByCityID`(
	in in_city_id INT
)
BEGIN

	-- 透過 sp_GetDistrictByCityID，輸入城市 ID，可以獲得此城市的 ID，還有其街區 ID 與街區名字。
    SELECT idtblCity, CityName, idtblDistrict, DistrictName
	FROM  tblCity
	JOIN tblDistrict ON (tblCity.idtblCity = tblDistrict.CityID)
	WHERE (idtblCity = in_city_id);

END