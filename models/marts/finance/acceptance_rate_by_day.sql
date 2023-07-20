SELECT
  transaction_date,
  acceptance_rate
FROM {{ ref('acceptance_rate')}}