
mysql> create database hospital_management;
Query OK, 1 row affected (0.08 sec)

mysql> use hospital_management;
Database changed
  

mysql> create table patients ( id int , Name varchar(100) , Age varchar(100) , Gender Varchar(100) , Contact varchar(100) , Address varchar(100));
Query OK, 0 rows affected (0.27 sec)

mysql> describe patients;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | int          | NO   | PRI | NULL    | auto_increment |
| Name    | varchar(100) | YES  |     | NULL    |                |
| age     | int          | YES  |     | NULL    |                |
| Gender  | varchar(100) | YES  |     | NULL    |                |
| Contact | varchar(100) | YES  |     | NULL    |                |
| Address | varchar(100) | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
6 rows in set (0.14 sec)

mysql> create table doctors (id int , Name varchar(100) , Specialization varchar(100) , Contact varchar(100));
Query OK, 0 rows affected (0.06 sec)
mysql> describe doctors;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| id             | int          | NO   | PRI | NULL    | auto_increment |
| Name           | varchar(100) | YES  |     | NULL    |                |
| Specialization | varchar(100) | YES  |     | NULL    |                |
| Contact        | varchar(100) | YES  |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
4 rows in set (0.03 sec)
mysql> create table visits (visit_id int , patient_id int , doctor_id int ,visit_date varchar(100) , diagnosis varchar(100) , status varchar(100));
Query OK, 0 rows affected (0.07 sec)
mysql> describe visits;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| visit_id   | int          | NO   | PRI | NULL    |       |
| patient_id | int          | YES  | MUL | NULL    |       |
| doctor_id  | int          | YES  | MUL | NULL    |       |
| visit_date | varchar(100) | YES  |     | NULL    |       |
| diagnosis  | varchar(100) | YES  |     | NULL    |       |
| status     | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
6 rows in set (0.11 sec)

mysql> describe bills;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| bill_id   | int           | NO   | PRI | NULL    | auto_increment |
| visit_id  | int           | YES  | MUL | NULL    |                |
| amount    | decimal(10,2) | YES  |     | NULL    |                |
| paid      | varchar(100)  | YES  |     | NULL    |                |
| bill_date | varchar(100)  | YES  |     | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> create table appointments (appointment_id int , patient_id int , doctor_id int , appointment_date varchar(100) , status varchar(100));
Query OK, 0 rows affected (0.06 sec)
mysql> describe appointments;
+------------------+--------------+------+-----+---------+----------------+
| Field            | Type         | Null | Key | Default | Extra          |
+------------------+--------------+------+-----+---------+----------------+
| appointment_id   | int          | NO   | PRI | NULL    | auto_increment |
| patient_id       | int          | YES  | MUL | NULL    |                |
| doctor_id        | int          | YES  | MUL | NULL    |                |
| appointment_date | date         | YES  |     | NULL    |                |
| status           | varchar(100) | YES  |     | NULL    |                |
+------------------+--------------+------+-----+---------+----------------+
5 rows in set (0.08 sec)

mysql> insert into patients (id , name , age , gender , contact , address) values
    ->  (1, 'Naveen', 21 , 'Male','8951783562','Lingasugur'),
    ->  (2, 'Suhas', 21 , 'Male','8073435376','Lingasugur');
Query OK, 2 rows affected (0.01 sec)
mysql> select * from patients;
+----+--------+------+--------+------------+------------+
| id | Name   | age  | Gender | Contact    | Address    |
+----+--------+------+--------+------------+------------+
|  1 | Naveen |   21 | Male   | 8951783562 | Lingasugur |
|  2 | Suhas  |   21 | Male   | 8073435376 | Lingasugur |
+----+--------+------+--------+------------+------------+
2 rows in set (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into doctors (id,name,specialization,contact) values
    -> (1,'Dr.Ravi Kumar', 'Eye_Specialist' ,'9916001892'),
    -> (2,'Dr.Naveen Kumar','Bone_Specialist','8951201568');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0
mysql> select * from doctors;
+----+-----------------+-----------------+------------+
| id | Name            | Specialization  | Contact    |
+----+-----------------+-----------------+------------+
|  1 | Dr.Ravi Kumar   | Eye_Specialist  | 9916001892 |
|  2 | Dr.Naveen Kumar | Bone_Specialist | 8951201568 |
+----+-----------------+-----------------+------------+
2 rows in set (0.00 sec)

mysql> insert into appointments (appointment_id,patient_id,doctor_id,appointment_date,status) values
    -> (1,1,1,'2025-07-21','completed'),
    -> (2,2,2,'2025-07-27','Scheduled');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0
mysql> select * from appointments;
+----------------+------------+-----------+------------------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | status    |
+----------------+------------+-----------+------------------+-----------+
|              1 |          1 |         1 | 2025-07-21       | completed |
|              2 |          2 |         2 | 2025-07-27       | Scheduled |
+----------------+------------+-----------+------------------+-----------+
2 rows in set (0.00 sec)

mysql> INSERT INTO visits (visit_id, patient_id, doctor_id, visit_date, diagnosis, status)
    -> VALUES
    -> (1, 1, 1, '2025-07-26', 'hypertension', 'treated'),
    -> (2, 2, 2, '2025-07-27', 'Skin Allergy', 'pending');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0
mysql> select * from visits;
+----------+------------+-----------+------------+--------------+---------+
| visit_id | patient_id | doctor_id | visit_date | diagnosis    | status  |
+----------+------------+-----------+------------+--------------+---------+
|        1 |          1 |         1 | 2025-07-26 | hypertension | treated |
|        2 |          2 |         2 | 2025-07-27 | Skin Allergy | pending |
+----------+------------+-----------+------------+--------------+---------+
2 rows in set (0.00 sec)

mysql> insert into bills (bill_id,visit_id,amount,paid,bill_date) values
    -> (1,1, '500','yes','2025-07-26'),
    -> (2,2,'300','No','2025-07-27');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0
mysql> select * from bills;
+---------+----------+--------+------+------------+
| bill_id | visit_id | amount | paid | bill_date  |
+---------+----------+--------+------+------------+
|       1 |        1 | 500.00 | yes  | 2025-07-26 |
|       2 |        2 | 300.00 | No   | 2025-07-27 |
+---------+----------+--------+------+------------+
2 rows in set (0.03 sec)


mysql> SELECT
    ->     a.appointment_id,
    ->     p.name AS patient_name,
    ->     d.name AS doctor_name,
    ->     a.appointment_date,
    ->     a.status
    -> FROM appointments a
    -> JOIN patients p ON a.patient_id = p.id
    -> JOIN doctors d ON a.doctor_id = d.id;
+----------------+--------------+-----------------+------------------+-----------+
| appointment_id | patient_name | doctor_name     | appointment_date | status    |
+----------------+--------------+-----------------+------------------+-----------+
|              1 | Naveen       | Dr.Ravi Kumar   | 2025-07-21       | completed |
|              2 | Suhas        | Dr.Naveen Kumar | 2025-07-27       | Scheduled |
+----------------+--------------+-----------------+------------------+-----------+
2 rows in set (0.06 sec)


mysql> SELECT b.bill_id, p.name AS patient_name, b.amount, b.paid
    -> FROM bills b
    -> JOIN visits v ON b.visit_id = v.visit_id
    -> JOIN patients p ON v.patient_id = p.id
    -> WHERE b.paid = 'No';
+---------+--------------+--------+------+
| bill_id | patient_name | amount | paid |
+---------+--------------+--------+------+
|       2 | Suhas        | 300.00 | No   |
+---------+--------------+--------+------+
1 row in set (0.02 sec)
mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE get_bill_amount(IN visit INT)
    -> BEGIN
    ->     SELECT b.amount
    ->     FROM bills b
    ->     WHERE b.visit_id = visit;
    -> END //
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL get_bill_amount(1);
+--------+
| amount |
+--------+
| 500.00 |
+--------+
1 row in set (0.03 sec)

Query OK, 0 rows affected (0.04 sec)

mysql> DELIMITER //
mysql> CREATE TRIGGER update_visit_status
    -> AFTER UPDATE ON bills
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.paid = 'Yes' THEN
    ->         UPDATE visits
    ->         SET status = 'discharged'
    ->         WHERE visit_id = NEW.visit_id;
    ->     END IF;
    -> END //
Query OK, 0 rows affected (0.05 sec)
mysql> DELIMITER ;

mysql> SELECT
    ->     v.visit_id,
    ->     p.name AS patient_name,
    ->     d.name AS doctor_name,
    ->     v.visit_date,
    ->     v.diagnosis,
    ->     v.status
    -> FROM visits v
    -> JOIN patients p ON v.patient_id = p.id
    -> JOIN doctors d ON v.doctor_id = d.id;
+----------+--------------+-----------------+------------+--------------+---------+
| visit_id | patient_name | doctor_name     | visit_date | diagnosis    | status  |
+----------+--------------+-----------------+------------+--------------+---------+
|        1 | Naveen       | Dr.Ravi Kumar   | 2025-07-26 | hypertension | treated |
|        2 | Suhas        | Dr.Naveen Kumar | 2025-07-27 | Skin Allergy | pending |
+----------+--------------+-----------------+------------+--------------+---------+
2 rows in set (0.00 sec)


