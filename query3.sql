#APPROACH.
1. To apply consecutive rows difference, I need to have id in int. Hence I am 
creating a new column with int as primary key.

mysql> ALTER TABLE doctors DROP PRIMARY KEY;
mysql> ALTER TABLE doctors  Add id  int primary key AUTO_INCREMENT;

2. to find consecutive rows order by visit_time
-- select doctor_id, visit_time
-- from doctors 
-- where doctor_id = 'doc40960233' 
-- order by visit_time;
3. consecutive rows difference
-- select T1.recordId, T1.TransDate, datediff(ss, T1.TransDate, T2.Transdate) as Diff
-- from Table1 T1
-- left join Table1 T2
-- on T1.Recordid = T2.RecordId +1

select doctor_id, count(temp1.tempdiff)
from 
(
select t1.doctor_id, timediff(t1.visit_time, t2.visit_time) as tempdiff
from (select id, visit_time, doctor_id from doctors order by visit_time) as t1
left join (select id, visit_time, doctor_id from doctors order by visit_time) as t2
on t1.id = t2.id + 1
having tempdiff <=1 
) as temp1
group by doctor_id;

+-------------+-----------------------+
| doctor_id   | count(temp1.tempdiff) |
+-------------+-----------------------+
| doc40960030 |                     1 |
| doc40960135 |                     1 |
| doc40960157 |                     3 |
| doc40960233 |                     1 |
| doc40960247 |                     1 |
| doc40960337 |                     1 |
| doc40960433 |                     1 |
| doc40961234 |                     1 |
| doc40961827 |                     1 |
| doc40962128 |                     2 |
| doc40962492 |                     1 |
| doc40962804 |                     1 |
| doc40962822 |                     3 |
| doc40962867 |                     1 |
+-------------+-----------------------+
14 rows in set (39.13 sec)


