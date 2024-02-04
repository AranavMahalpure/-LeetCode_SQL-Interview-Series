# Write your MySQL query statement below
select distinct p.product_id, coalesce( p2.new_price ,10) as price from Products p left join (
    select * from Products where (product_id,change_date) in (
    select product_id,max(change_date) from products
    where change_date <= '2019-08-16'
    group by product_id
)) p2 on p.product_id = p2.product_id
group by product_id