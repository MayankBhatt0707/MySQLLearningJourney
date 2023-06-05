-- date, fiscal_year, customer_code, customer, market, product_code, product, variant,
-- sold_quanity, gross_price_per_item, gross_price_total

create view `gross_price_total` as
select s.date as date, 
	s.fiscal_year,
    c.customer_code, 
    c.customer, 
    c.market, 
    p.product_code,
    p.product,
    p.variant,
    s.sold_quantity,
    round(g.gross_price, 2),
    round(g.gross_price * s.sold_quantity, 2) as gross_price_total
    from fact_sales_monthly s join dim_customer c
    on s.customer_code = c.customer_code
    join dim_product p 
    on s.product_code = p.product_code
    join fact_gross_price g 
    on s.product_code = g.product_code 
    and g.fiscal_year = get_fiscal_year(s.date)
    limit 1000000;

 