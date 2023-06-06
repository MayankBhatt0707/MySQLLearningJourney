SELECT market, round(sum(net_sales)/1000000,2) as net_sales FROM gdb0041.net_sales_total
where fiscal_year = 2021
group by market
order by net_sales desc
limit 5;