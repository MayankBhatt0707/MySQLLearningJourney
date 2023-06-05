drop procedure if  exists market_baged();
delimiter $$
create procedure market_badge
(
in fiscal_year year,
in market varchar(45),
out badge varchar(10)
)
begin  
	declare qty float;
	select sum(sold_quantity) into qty from
	fact_sales_monthly s join dim_customer c
	using(customer_code)
	where c.market = market and get_fiscal_year(s.date) = fiscal_year
	group by c.market;
    
    if (qty > 5000000) then
		set badge = "Gold";
    else
		set badge = "Silver";
    end if;
end;
$$

