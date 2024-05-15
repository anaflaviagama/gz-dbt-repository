SELECT
orders_id
,products_id
,date_date
,revenue
,quantity
,CAST(purchase_price as FLOAT64) as purchase_price
,ROUND((quantity * purchase_price),2) as purchase_cost
,ROUND(revenue - quantity * CAST(purchase_price as FLOAT64),2) as margin
FROM {{ref("stg_raw__sales")}} sales
LEFT JOIN {{ref("stg_raw__product")}} product
USING (products_id) 