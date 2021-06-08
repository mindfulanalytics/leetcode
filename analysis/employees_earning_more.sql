with employees as (
    select 
        id,
        employee_name,
        salary,
        manager_id
    from {{ ref( 'employees_earning_more' ) }}
),

final as (
    select
        a.employee_name as Employee
    from employees a
    join employees b on a.manager_id = b.id where a.salary > b.salary
)

select * from final