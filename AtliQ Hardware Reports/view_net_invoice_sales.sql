create view net_invoice_sales as
SELECT 
g.date,
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
round((1 -pre_invoice_discount_pct) * gross_price_total, 2) as net_invoice_sales 
FROM gross_price_total g join fact_pre_invoice_deductions p 
on p.customer_code = g.customer_code 
and p.fiscal_year = g.fiscal_year
;