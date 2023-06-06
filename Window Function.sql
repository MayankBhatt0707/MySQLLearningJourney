select *, 
amount*100/ sum(amount)over() as pct
from expenses
order by category
