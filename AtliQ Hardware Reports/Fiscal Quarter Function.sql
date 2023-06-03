CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_quarter`(d date) RETURNS char(2) CHARSET utf8mb4
    DETERMINISTIC
begin
 declare fiscal_quarter char(2);
 set fiscal_quarter = concat("Q", quarter(date_add(d, interval 4 month)));
return fiscal_quarter;
end