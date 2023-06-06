select *, 
amount*100/ sum(amount) over(partition by category) as pct
from expenses
order by category