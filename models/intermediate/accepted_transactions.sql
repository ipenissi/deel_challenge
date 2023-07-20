select
    external_ref,
    status,
    source,
    ref,
    date_time,
    state,
    cvv_provided,
    amount,
    country,
    currency
from {{ ref("stg_globalpay_acceptance_report") }}
where state = 'ACCEPTED'
