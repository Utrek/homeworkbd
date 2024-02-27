Задание 2

select name, duration from treks
where duration = (select MAX(duration) from treks);

select name from treks
where (duration/60) >= 3.5;

select name from collections
where year_of_issue between 2018 and 2020;

select name from executors
where name not like '% %';

select name from treks
where name like '%My%' or name like '%Мой%';

Задание 3

select genre_id, COUNT(executor_id) from executorsgenes
group by genre_id 
order by COUNT(executor_id) desc;

SELECT COUNT(trek_id) FROM trekscollections t
join collections c on c.collection_id = t.collection_id 
where year_of_issue between 2019 and 2020;

select a.name, avg(duration)/60 as avg_мин from treks t 
join albums a on a.album_id = t.album_id 
group by a.name;

select a.name, avg(duration) as avg_сек from treks t 
join albums a on a.album_id = t.album_id 
group by a.name;

select e.name from executors e
where e.name != (select e3.name from executors e3 
join executorsalbums e2 on e3.executor_id = e2.executor_id 
join albums a on a.album_id = e2.album_id  where a.year_of_issue = 2020)
group by e.name; 

select distinct c.name from collections c 
join trekscollections t on t.collection_id = c.collection_id 
join treks t2 on t2.trek_id = t.trek_id 
join albums a on a.album_id = t2.album_id 
join executorsalbums e on e.album_id = a.album_id 
join executors e2 on e2.executor_id = e.executor_id 
where  e2.name = 'Ёж';

Задание 4

select a.name from executorsgenes e 
join executors e2 on e2.executor_id  = e.executor_id 
join executorsalbums e3 on e3.executor_id = e2.executor_id
join albums a on a.album_id = e3.album_id 
group by a.name
having count(e.genre_id) !=1;

SELECT t1.name FROM treks t1
WHERE NOT EXISTS ( SELECT 1 FROM trekscollections t2
WHERE t1.trek_id = t2.trek_id);

SELECT t2.name FROM treks t2 
LEFT JOIN trekscollections t  ON t2.trek_id  = t.trek_id 
WHERE t.trek_id  IS NULL;

select e.name from executors e 
join executorsalbums e3 on e3.executor_id = e.executor_id
join albums a on a.album_id = e3.album_id
join treks t on t.album_id = a.album_id 
where duration = (select Min(duration) from treks);

select a.name  from albums a 
join treks t on t.album_id = a.album_id
group by a.name
having count(*) <= (select count(*) from albums a 
join treks t on t.album_id = a.album_id
group by a.name 
order by count(*)
limit 1);































