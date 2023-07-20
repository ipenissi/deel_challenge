select 
    external_ref,
    status,
    source,
    chargeback
from {{ source("deel_raw_data", "globepay_chargeback_report") }}
