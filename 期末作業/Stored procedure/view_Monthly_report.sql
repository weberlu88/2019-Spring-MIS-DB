CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `catcat`@`192.168.56.1` 
    SQL SECURITY DEFINER
VIEW `db_Weber_finalHW`.`view_Monthly_report` AS
    SELECT 
        SUM(`db_Weber_finalHW`.`tblOrder`.`OrderTotal`) AS `Revenue This Month`,
        (SUM(`db_Weber_finalHW`.`tblOrder`.`OrderTotal`) / COUNT(`db_Weber_finalHW`.`tblOrder`.`idtlbOrder`)) AS `Average spending per order`,
        FK_TOPTHREEPOPULARITEMSBOUGHT() AS `Top 3 popular items bought`,
        FK_NUMBEROFNEWREGISTRATION((FK_GETLASTMONTH() + 1)) AS `Number of new registration This Month`
    FROM
        `db_Weber_finalHW`.`tblOrder`
    WHERE
        (MONTH(`db_Weber_finalHW`.`tblOrder`.`CreateDateTime`) = (FK_GETLASTMONTH() + 1))