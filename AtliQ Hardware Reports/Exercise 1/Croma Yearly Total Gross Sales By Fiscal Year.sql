select get_fiscal_year(s.Date) as `Fiscal Year`, round(sum(s.sold_quantity * g.gross_price),2) as `Total Gross Sales Amount`
from fact_sales_monthly as s join fact_gross_price as g
on s.product_code = g.product_code
and g.fiscal_year = get_fiscal_year (s.date)
where s.customer_code = 90002002
group by get_fiscal_year(s.date)
order by get_fiscal_year(s.date)