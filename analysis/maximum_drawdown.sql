with data as (
    select
        id,
        year_at,
        portfolio_value,
        min(portfolio_value) over() as min_value,
        max(portfolio_value) over() as max_value
    from {{ ref('maximum_drawdown') }}
),


trough_at as (

    select 
        case 
            when portfolio_value = min_value
            then year_at
        end as trough_at,
        case
            when 
    from data
    where portfolio_value = min_value


peak as (
    select max(portfolio_value) over() as max_value
    from data
    left join using 
)


select * from trough