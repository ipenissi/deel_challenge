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
    trx.currency,
    cb.chargeback
from {{ ref("stg_globalpay_acceptance_report") }} trx
left join
    {{ ref("stg_globalpay_chargeback_report") }} cb
    on trx.external_ref = cb.external_ref
