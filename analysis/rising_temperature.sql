with weather as (

    select
        id,
        record_at,
        temperature,
        lag(record_at,1) over(order by record_at) as prev_date,
        lag(temperature,1) over(order by record_at) as prev_temp
    from {{ ref( 'rising_temperature' ) }}

),

final as (

    select 
        *,
        case 
            when temperature > prev_temp then 1
            else 0
        end as rising_temp_flag
    from weather
)

select id 
from final 
where rising_temp_flag = 1
order by id