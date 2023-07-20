select country, round(sum(amount), 2) as total_declined_amount
from {{ ref("declined_transactions") }}
group by country
having total_declined_amount > 25000000
order by total_declined_amount desc
