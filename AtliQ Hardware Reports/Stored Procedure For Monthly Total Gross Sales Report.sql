delimiter &&
create procedure `Monthly total Gross Sales` 
(
customer_code Text
)
begin
	select s.Date as "Month", round(sum(s.sold_quantity * g.gross_price),2) as `Total Gross Sales Amount`
	from fact_sales_monthly as s join fact_gross_price as g
	on s.product_code = g.product_code
	and g.fiscal_year = get_fiscal_year (s.date)
	where Find_in_set(customer_code, s.customer_code)>0
	group by s.date
	order by s.date;
end;
&&    