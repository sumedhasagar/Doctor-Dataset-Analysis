# This file contains commmands to setup the mysql dev env. Loading the csv file into mysql.

#TO start mysql server
/usr/local/mysql/bin/mysql -uroot -p --local-infile shopg
 
create table doctors(
    visit_id varchar(100) not null,
    visit_time datetime,
    doctor_id varchar(50),
    patient_id varchar(100),
    primary key (visit_id)
    );

# There was an error coming. a MYSQL Bug. LOAD DATA INFILE not working
# Following things were done to resolve the bug. We have to set 'local_infile=1' for our db

# loads csv data to a table
LOAD DATA LOCAL INFILE '/Users/home/shopg_assignment/Data_Assignment.csv'
INTO TABLE doctors FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (visit_id, visit_time, doctor_id, patient_id);


SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;