with customers as (

    select 
        id as customer_id,
        name 
    from {{ ref('customers_who_never_order') }}

),

orders as (

    select 
        id,
        customer_id 
    from {{ ref('orders_who_never_order') }}

),

customer_orders as (
    select 
        customer_id,
        count(id) as number_of_orders
    from orders
    group by 1 
),

final as (
    select 
        name as Customers,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders
    from customers
    left join customer_orders using (customer_id)
)

select Customers from final where number_of_orders = 0 