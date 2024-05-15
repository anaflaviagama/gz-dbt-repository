SELECT
orders_id
,date_date
,revenue
,quantity
,purchase_cost
,margin
,ROUND(CAST(shipping_fee as FLOAT64),2) as shipping_fee
,ROUND(CAST(logcost as FLOAT64),2) as logcost
,ROUND(CAST(ship_cost as FLOAT64),2) as ship_cost
,ROUND((margin + shipping_fee - logcost - ship_cost),2) as operational margin
FROM {{ref("int_orders_margin")}} margin
LEFT JOIN {{ref("stg_raw__ship")}} ship
USING (orders_id)
GROUP BY orders_id
ORDER BY orders_id DESC

-- SELECT
-- orders_id
-- ,date_date
-- ,ROUND(SUM(revenue),2) as revenue
-- ,ROUND(SUM(quantity),2) as quantity
-- ,ROUND(SUM(purchase_cost),2) as purchase_cost
-- ,ROUND(SUM(margin),2) as margin
-- ,ROUND(SUM(CAST(shipping_fee as FLOAT64)),2) as shipping_fee
-- ,ROUND(SUM(CAST(logcost as FLOAT64)),2) as logcost
-- ,ROUND(SUM(CAST(ship_cost as FLOAT64),2)) as ship_cost
-- ,ROUND(SUM(margin + shipping_fee - logcost - ship_cost),2) as operational margin
-- FROM {{ref("int_orders_margin")}}
-- LEFT JOIN {{ref("stg_raw__ship")}}
-- USING orders_id
-- GROUP BY orders_id,date_date
-- ORDER BY orders_id DESC