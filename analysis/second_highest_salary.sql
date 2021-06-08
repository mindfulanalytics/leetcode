# Write your MySQL query statement below
with salaries as (

    select
        Id,
        Salary,
        rank() over (order by Salary desc) as rank_salary,
        max(salary) over() as max_salary
    from {{ ref('second_highest_salary') }}
),

second_highest_salary as (

    select 
        salary as SecondHighestSalary 
    from salaries 
    where rank_salary = 2

)

select 
    IFNULL(SecondHighestSalary,NULL) as SecondHighestSalary 
from second_highest_salary
