# Write your MySQL query statement below
with a as (
select m.title as results from Movies m inner join (select movie_id,avg(rating) as avg_rating from MovieRating where created_at < '2020-03-01' and created_at > '2020-01-31'
    group by movie_id
    order by avg_rating desc
) x on x.movie_id = m.movie_id 
order by x.avg_rating desc , m.title asc
limit 1
), 

b as ( select u.name as results from Users u inner join (
    select user_id , count(user_id) as user_count from MovieRating 
group by user_id
) y
on u.user_id = y.user_id 
order by y.user_count desc , u.name asc
limit 1
)

select * from b
union all
select *  from a