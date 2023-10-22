insert into batch_32.kemas (nama, tempat_lahir, tanggal_lahir, background_studi, jarak_rumah, nomor_sepatu)
values ('Kemas Muhammad Rizki Fadhila','London','01-22-2000','Kendali',15.0,42)
 ,('Julius Timothy','Jakarta','07-01-2000','Geophysist Engineer',25.0,42);
 
update batch_32.kemas set nama = 'Doni Salmanan' where background_studi = 'Kendali';

select * from kemas ;

select tempat_lahir,background_studi from kemas ;


SELECT * 
from batch_32.customer_data 
where customer_state = 'SP' 
limit 10;

delete from kemas where nama = 'Doni Salmanan'

select*
from batch_32.order_items_data
order by product_id asc 

select*
from batch_32.product_data

select count(distinct product_id)
from batch_32.order_items_data

--Wildcard--
select *
from batch_32.customer_data
--where customer_city like '%paulo'
where customer_city like 'paulo%'

--Upper/lower--
select upper(customer_city) as city_upper, *
from batch_32.customer_data

--Concat--
select concat(customer_city,'-',customer_zip_code_prefix) as labels
from batch_32.customer_data

-- null value handling --
select product_category_name, 
nullif(product_category_name, 'no category') as product_category_name_nullif,
coalesce(product_category_name, 'no category') as product_category_name_coalesce
from batch_32.product_data
where product_category_name is null

select product_category_name, nullif(product_category_name, 'no category') as product_category_name_cleaned
from batch_32.product_data
where product_category_name is null

-- date function --
select 	order_purchase_timestamp,
		date(order_purchase_timestamp) as order_purchase_date,
		date_part('month', date(order_purchase_timestamp)) as order_purchase_month_part,
		date_trunc('month', date(order_purchase_timestamp)) as order_purchase_month_trunc, 
		date(date_trunc('month', date(order_purchase_timestamp))) as order_purchase_month_trunc_cleaned
from batch_32.orders_data
