create view `net_sales_total` as
select g.date,
g.fiscal_year,
g.customer_code,
g.customer,
g.market,
g.product_code,
g.product,
g.variant,
g.sold_quantity,
g.gross_price,
gross_price_total,
round((1- (p.discounts_pct + p.other_deductions_pct))* g.net_invoice_sales, 2) as net_sales 
from net_invoice_sales g join fact_post_invoice_deductions p 
on g.customer_code = p.customer_code
and g.product_code = p.product_code
and g.date = p.date