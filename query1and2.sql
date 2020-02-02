# Query 1. 
# doctor has generated atleast 100 prescriptions in lifetime

mysql> select doctor_id, Count(doctor_id) as occurence 
from doctors  
group by doctor_id  
having occurence > 100 
order by occurence DESC;
+-------------+-----------+
| doctor_id   | occurence |
+-------------+-----------+
| doc40960157 |      2547 |
| doc40962867 |      2539 |
| doc40960247 |      2470 |
| doc40962822 |      2249 |
| doc40960135 |      1744 |
| doc40962804 |      1574 |
| doc40962492 |      1311 |
| doc40961234 |      1308 |
| doc40961827 |      1232 |
| doc40960233 |      1171 |
| doc40960433 |       765 |
| doc40960022 |       514 |
| doc40960030 |       472 |
| doc40960337 |       386 |
| doc40962128 |       137 |
+-------------+-----------+
15 rows in set (0.02 sec)


# Query 2.
# doctor has seen atleast 10 different patients in month of july
mysql> select doctor_id, Count(distinct(patient_id)) as occurence
from doctors
where month(visit_time) = 7
group by doctor_id
having occurence > 10
order by occurence DESC;
+-------------+-----------+
| doctor_id   | occurence |
+-------------+-----------+
| doc40962867 |      1580 |
| doc40960157 |      1195 |
| doc40960247 |       965 |
| doc40962822 |       719 |
| doc40960135 |       688 |
| doc40962804 |       620 |
| doc40961234 |       612 |
| doc40962492 |       571 |
| doc40960233 |       550 |
| doc40961827 |       499 |
| doc40960433 |       372 |
| doc40960022 |       353 |
| doc40960030 |       222 |
| doc40960337 |       151 |
| doc40962128 |       118 |
+-------------+-----------+
15 rows in set (0.05 sec)

