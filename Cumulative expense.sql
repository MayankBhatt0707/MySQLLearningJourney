select *, 
sum(amount) over(partition by category order by date) as pct
from expenses
order by category