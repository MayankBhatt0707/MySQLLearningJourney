/* Create a report for Croma India For Fiscal Year 2021 containing:
Month
Product Name
Variant
Sold Quantity
Gross Price Per Item
Grossprice Total */

select s.date as `Month`, p.product_code as "Product code", p.product as `Product Name`, p.variant as `Variant`, s.sold_quantity as `Sold Quantity`, round(g.gross_price,2) as `Grossprice Per Item`, round(s.sold_quantity * g.gross_price, 2) as `Grossprice Total`
from fact_sales_monthly s join dim_product p
using (product_code) join
fact_gross_price g 
on p.product_code = g.product_code
and g.fiscal_year = get_fiscal_year(s.date)
where s.customer_code = 90002002 and get_fiscal_year(s.date) = 2021 
Order by date asc