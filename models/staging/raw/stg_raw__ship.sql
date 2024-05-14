with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost,
        ship_cost

    from source

)

-- select * 
-- from renamed
-- WHERE shipping_fee != shipping_fee_1

select
    orders_id
    , shipping_fee
    , logcost
    , ship_cost
from {{ source('raw', 'ship') }}