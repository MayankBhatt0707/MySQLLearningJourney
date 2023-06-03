CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_year`(d date) RETURNS year
    DETERMINISTIC
BEGIN
DECLARE fiscal_year Year;
set fiscal_year = year(date_add(d, interval 4 month));
RETURN fiscal_year;
END