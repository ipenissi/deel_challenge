select
    trx.external_ref,
    trx.status,
    trx.source,
    trx.ref,
    trx.date_time,
    trx.state,
    trx.cvv_provided,
    trx.amount,
    trx.country,
    trx.currency
from {{ ref("transactions") }} as trx
left join
    {{ ref("stg_globalpay_chargeback_report") }} as chargeback
    on trx.external_ref = chargeback.external_ref
where chargeback.external_ref is null
