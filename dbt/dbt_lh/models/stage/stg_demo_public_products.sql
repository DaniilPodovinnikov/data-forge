{{ config(materialized='table') }}

select 
    after.product_id
    , after.title
from {{ source('raw', 'demo_public_products') }}
