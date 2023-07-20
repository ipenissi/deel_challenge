-- CTE to calculate the count of accepted transactions per day
with
    accepted_transactions as (
        select date(date_time) as transaction_date, count(*) as accepted_count
        from {{ ref("accepted_transactions") }}
        group by 1
    ),

    -- CTE to calculate the total count of  rejected transactions per day 
    declined_transactions as (
        select date(date_time) as transaction_date, count(*) as declined_count
        from {{ ref("declined_transactions") }}
        group by 1
    )

-- Calculate the acceptance rate over time
select
    atrx.transaction_date,
    round(
        atrx.accepted_count / (atrx.accepted_count + dt.declined_count), 2
    ) acceptance_rate
from accepted_transactions atrx
join declined_transactions dt on atrx.transaction_date = dt.transaction_date
order by atrx.transaction_date
