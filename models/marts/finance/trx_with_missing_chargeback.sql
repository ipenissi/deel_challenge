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
from {{ ref("missing_chargeback_data") }}
