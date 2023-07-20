{% set currencies = ["CAD", "EUR", "MXN", "USD", "SGD", "AUD", "GBP"] %}

SELECT
    external_ref,
    status,
    source,
    ref,
    date_time,
    state,
    cvv_provided,
    amount,
    country,
    currency,
    {% for currencies in currencies %}
        json_extract_scalar(rates, '$.{{currencies}}') AS {{ currencies }}_rate
        {% if not loop.last %}, {% endif %}
    {% endfor %}
FROM {{ source("deel_raw_data", "globalpay_acceptance_report") }}
