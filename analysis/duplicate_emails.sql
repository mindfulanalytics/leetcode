with seed as (

    select
        id,
        email,
        rank() over (partition by email order by id) as email_rank
    from {{ ref('duplicate_emails') }}

)

select
    id,
    email
from seed
where email_rank = 1