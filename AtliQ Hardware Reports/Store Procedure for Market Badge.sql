CREATE DEFINER=`root`@`localhost` PROCEDURE `market_badge`(
in fiscal_year int,
in market varchar(45),
out badge varchar(10)
)
begin  
	declare qty float;
	select sum(s.sold_quantity) Into qty from 
	fact_sales_monthly s join dim_customer c
	using(customer_code)
	where c.market = market and get_fiscal_year(s.date) = fiscal_year
	group by c.market;
    
    if (qty > 5000000) then
		set badge = "Gold";
    else
		set badge = "Silver";
    end if;
end