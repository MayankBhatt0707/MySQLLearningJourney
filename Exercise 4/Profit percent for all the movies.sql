select 
        *, 
    (revenue-budget) as profit, 
    round((revenue-budget)*100/budget,2) as profit_pct 
   from financials




