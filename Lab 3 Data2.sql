//Command
select 75/15, 61+(3*3), 5/2;

select myear from movies where mtitle='Casablanka';
select * from persons order by pname ASC;
select * from persons order by pdob DESC;
select * from persons order by pdob ASC;
select count(*) from persons;
select pname, length(pname) from persons;

select pname, DATE_FORMAT(pdob,'%W %d %M %Y') from persons;
select pname, YEAR(NOW())-YEAR(pdob) from persons;
select * from persons group by psex;
select psex, count(psex) from persons group by psex;
select * from movies ; 
select * from movies, roles where movies.mid=roles.mid; 
select * from persons, roles where persons.pid=roles.pid; 

select h.pname as fullname from persons as h;

///create a new username;

create user fazumia@localhost identified by '1234';
show grants for fazumia@localhost;


//Code;
mysql> use shc;
Database changed
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| shc                |
+--------------------+
2 rows in set

mysql> show tables;
Empty set

mysql> create table movies(
mid int(10) unsigned not null auto_increment,
mtitle varchar(255) not null default ' ',
myear year(4) not null default '0000',
primary key(mid)
)ENGINE =InnoDB;
Query OK, 0 rows affected

mysql> create table persons (
pid int(10) unsigned not null auto_increment,
pname varchar(255) not null default ' ',
psex enum('M','F') not null  default 'M',
pdob date not null ,
primary key(pid)
)ENGINE = InnoDB;
Query OK, 0 rows affected

mysql> create table roles(
mid int(10) not null default '0' references movies(mid),
pid int(10) not null default '0' references persons(pid),
role enum('A','D') not null default 'A',
primary key(mid,pid,role)
)ENGINE = InnoDB;
Query OK, 0 rows affected

mysql> show tables;
+---------------+
| Tables_in_shc |
+---------------+
| movies        |
| persons       |
| roles         |
+---------------+
3 rows in set

mysql> insert into movies values(1,'Rear Window',1954);
insert into movies values(NULL,'To Catch A Thief',1955);
insert into movies values(NULL,'The Maltese Falcon',1941);
insert into movies values(NULL,'The Birds',1963);
insert into movies values(NULL,'North By North West',1959);
insert into movies values(NULL,'Casablanka',1942);
insert into movies values(NULL,'Anatomy of A Murder',1959);
Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

mysql> 
insert into persons values(1,'Alfred Hitchcock','M','1899-08-13');
insert into persons values(NULL,'Cary Grant','M','1904-01-18');
insert into persons values(NULL,'Grace Kelly','F','1929-11-12');
insert into persons values(NULL,'Humphery Bogart','M','1899-12-25');
insert into persons values(NULL,'Sydney Greenstreet','M','1879-12-27');
insert into persons values(NULL,'James stewart','M','1908-05-20');
Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

mysql> insert into roles values(1,1,'D');
insert into roles values(1,3,'A');
insert into roles values(1,6,'A');
insert into roles values(2,1,'D');
insert into roles values(2,2,'A');
insert into roles values(2,3,'A');
insert into roles values(3,4,'A');
insert into roles values(3,5,'A');
insert into roles values(4,1,'D');
insert into roles values(5,1,'D');
insert into roles values(5,2,'A');
insert into roles values(6,4,'A');

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

mysql> select * from movies;
+-----+---------------------+-------+
| mid | mtitle              | myear |
+-----+---------------------+-------+
|   1 | Rear Window         |  1954 |
|   2 | To Catch A Thief    |  1955 |
|   3 | The Maltese Falcon  |  1941 |
|   4 | The Birds           |  1963 |
|   5 | North By North West |  1959 |
|   6 | Casablanka          |  1942 |
|   7 | Anatomy of A Murder |  1959 |
+-----+---------------------+-------+
7 rows in set

mysql> select * from persons;
+-----+--------------------+------+------------+
| pid | pname              | psex | pdob       |
+-----+--------------------+------+------------+
|   1 | Alfred Hitchcock   | M    | 1899-08-13 |
|   2 | Cary Grant         | M    | 1904-01-18 |
|   3 | Grace Kelly        | F    | 1929-11-12 |
|   4 | Humphery Bogart    | M    | 1899-12-25 |
|   5 | Sydney Greenstreet | M    | 1879-12-27 |
|   6 | James stewart      | M    | 1908-05-20 |
+-----+--------------------+------+------------+
6 rows in set

mysql> select * from roles;
+-----+-----+------+
| mid | pid | role |
+-----+-----+------+
|   1 |   1 | D    |
|   1 |   3 | A    |
|   1 |   6 | A    |
|   2 |   1 | D    |
|   2 |   2 | A    |
|   2 |   3 | A    |
|   3 |   4 | A    |
|   3 |   5 | A    |
|   4 |   1 | D    |
|   5 |   1 | D    |
|   5 |   2 | A    |
|   6 |   4 | A    |
+-----+-----+------+
12 rows in set

mysql> drop table persons;
Query OK, 0 rows affected

mysql> show tables;
+---------------+
| Tables_in_shc |
+---------------+
| movies        |
| roles         |
+---------------+
2 rows in set

mysql> source d:/ person.sql;
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'source d:/ person.sql' at line 1
mysql> source D:/ person.sql;
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'source D:/ person.sql' at line 1
mysql> source D:/ person.sql;
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'source D:/ person.sql' at line 1
mysql> select 75/15, 61+(3*3), 5/2;
+-------+----------+-----+
| 75/15 | 61+(3*3) | 5/2 |
+-------+----------+-----+
| 5     |       70 | 2.5 |
+-------+----------+-----+
1 row in set

mysql> create table persons (
pid int(10) unsigned not null auto_increment,
pname varchar(255) not null default ' ',
psex enum('M','F') not null  default 'M',
pdob date not null ,
primary key(pid)
)ENGINE = InnoDB;
Query OK, 0 rows affected

mysql> insert into persons values(1,'Alfred Hitchcock','M','1899-08-13');
insert into persons values(NULL,'Cary Grant','M','1904-01-18');
insert into persons values(NULL,'Grace Kelly','F','1929-11-12');
insert into persons values(NULL,'Humphery Bogart','M','1899-12-25');
insert into persons values(NULL,'Sydney Greenstreet','M','1879-12-27');
insert into persons values(NULL,'James stewart','M','1908-05-20');
Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

Query OK, 1 row affected

mysql> show tables;
+---------------+
| Tables_in_shc |
+---------------+
| movies        |
| persons       |
| roles         |
+---------------+
3 rows in set

mysql> select * from movies;
+-----+---------------------+-------+
| mid | mtitle              | myear |
+-----+---------------------+-------+
|   1 | Rear Window         |  1954 |
|   2 | To Catch A Thief    |  1955 |
|   3 | The Maltese Falcon  |  1941 |
|   4 | The Birds           |  1963 |
|   5 | North By North West |  1959 |
|   6 | Casablanka          |  1942 |
|   7 | Anatomy of A Murder |  1959 |
+-----+---------------------+-------+
7 rows in set

mysql> select mtitle,mid from movies;
+---------------------+-----+
| mtitle              | mid |
+---------------------+-----+
| Rear Window         |   1 |
| To Catch A Thief    |   2 |
| The Maltese Falcon  |   3 |
| The Birds           |   4 |
| North By North West |   5 |
| Casablanka          |   6 |
| Anatomy of A Murder |   7 |
+---------------------+-----+
7 rows in set

mysql> select mtitle,myear,mid from movies;
+---------------------+-------+-----+
| mtitle              | myear | mid |
+---------------------+-------+-----+
| Rear Window         |  1954 |   1 |
| To Catch A Thief    |  1955 |   2 |
| The Maltese Falcon  |  1941 |   3 |
| The Birds           |  1963 |   4 |
| North By North West |  1959 |   5 |
| Casablanka          |  1942 |   6 |
| Anatomy of A Murder |  1959 |   7 |
+---------------------+-------+-----+
7 rows in set

mysql> select * from movies where>=1955
;
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '>=1955' at line 1
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '>=1955' at line 1
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1064 - You have an error in your SQL syntax' at line 1
    -> ;
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'the manual that corresponds to your MySQL server version for the right syntax to' at line 1
mysql> select * from movies where>=1955;
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '>=1955' at line 1
mysql> select myear from movies where mtitle'Casablanca';
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Casablanca'' at line 1
mysql> select * from movies;
+-----+---------------------+-------+
| mid | mtitle              | myear |
+-----+---------------------+-------+
|   1 | Rear Window         |  1954 |
|   2 | To Catch A Thief    |  1955 |
|   3 | The Maltese Falcon  |  1941 |
|   4 | The Birds           |  1963 |
|   5 | North By North West |  1959 |
|   6 | Casablanka          |  1942 |
|   7 | Anatomy of A Murder |  1959 |
+-----+---------------------+-------+
7 rows in set

mysql> select myear from movies where mtitle'Casablanka';
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Casablanka'' at line 1
mysql> select myear from movies where mtitle='Casablanka';
+-------+
| myear |
+-------+
|  1942 |
+-------+
1 row in set

mysql> 
select * from persons order by pname ASC;
+-----+--------------------+------+------------+
| pid | pname              | psex | pdob       |
+-----+--------------------+------+------------+
|   1 | Alfred Hitchcock   | M    | 1899-08-13 |
|   2 | Cary Grant         | M    | 1904-01-18 |
|   3 | Grace Kelly        | F    | 1929-11-12 |
|   4 | Humphery Bogart    | M    | 1899-12-25 |
|   6 | James stewart      | M    | 1908-05-20 |
|   5 | Sydney Greenstreet | M    | 1879-12-27 |
+-----+--------------------+------+------------+
6 rows in set

mysql> 
select * from persons order by pdob ASC;
+-----+--------------------+------+------------+
| pid | pname              | psex | pdob       |
+-----+--------------------+------+------------+
|   5 | Sydney Greenstreet | M    | 1879-12-27 |
|   1 | Alfred Hitchcock   | M    | 1899-08-13 |
|   4 | Humphery Bogart    | M    | 1899-12-25 |
|   2 | Cary Grant         | M    | 1904-01-18 |
|   6 | James stewart      | M    | 1908-05-20 |
|   3 | Grace Kelly        | F    | 1929-11-12 |
+-----+--------------------+------+------------+
6 rows in set

mysql> 
select * from persons order by pdob DESC;
+-----+--------------------+------+------------+
| pid | pname              | psex | pdob       |
+-----+--------------------+------+------------+
|   3 | Grace Kelly        | F    | 1929-11-12 |
|   6 | James stewart      | M    | 1908-05-20 |
|   2 | Cary Grant         | M    | 1904-01-18 |
|   4 | Humphery Bogart    | M    | 1899-12-25 |
|   1 | Alfred Hitchcock   | M    | 1899-08-13 |
|   5 | Sydney Greenstreet | M    | 1879-12-27 |
+-----+--------------------+------+------------+
6 rows in set

mysql> select count(*) from persons;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set

mysql> select pname, length(pname) from persons;
+--------------------+---------------+
| pname              | length(pname) |
+--------------------+---------------+
| Alfred Hitchcock   |            16 |
| Cary Grant         |            10 |
| Grace Kelly        |            11 |
| Humphery Bogart    |            15 |
| Sydney Greenstreet |            18 |
| James stewart      |            13 |
+--------------------+---------------+
6 rows in set

mysql> select pname, DATE_FORMAT(pdob,'%W %d %M %Y') from persons;
+--------------------+---------------------------------+
| pname              | DATE_FORMAT(pdob,'%W %d %M %Y') |
+--------------------+---------------------------------+
| Alfred Hitchcock   | Sunday 13 August 1899           |
| Cary Grant         | Monday 18 January 1904          |
| Grace Kelly        | Tuesday 12 November 1929        |
| Humphery Bogart    | Monday 25 December 1899         |
| Sydney Greenstreet | Saturday 27 December 1879       |
| James stewart      | Wednesday 20 May 1908           |
+--------------------+---------------------------------+
6 rows in set

mysql> select * from persons;
+-----+--------------------+------+------------+
| pid | pname              | psex | pdob       |
+-----+--------------------+------+------------+
|   1 | Alfred Hitchcock   | M    | 1899-08-13 |
|   2 | Cary Grant         | M    | 1904-01-18 |
|   3 | Grace Kelly        | F    | 1929-11-12 |
|   4 | Humphery Bogart    | M    | 1899-12-25 |
|   5 | Sydney Greenstreet | M    | 1879-12-27 |
|   6 | James stewart      | M    | 1908-05-20 |
+-----+--------------------+------+------------+
6 rows in set

mysql> select pname, YEAR(NOW())-YEAR(pdob) from persons;
+--------------------+------------------------+
| pname              | YEAR(NOW())-YEAR(pdob) |
+--------------------+------------------------+
| Alfred Hitchcock   |                    119 |
| Cary Grant         |                    114 |
| Grace Kelly        |                     89 |
| Humphery Bogart    |                    119 |
| Sydney Greenstreet |                    139 |
| James stewart      |                    110 |
+--------------------+------------------------+
6 rows in set

mysql> select * from persons group by psex;
+-----+------------------+------+------------+
| pid | pname            | psex | pdob       |
+-----+------------------+------+------------+
|   1 | Alfred Hitchcock | M    | 1899-08-13 |
|   3 | Grace Kelly      | F    | 1929-11-12 |
+-----+------------------+------+------------+
2 rows in set

mysql> select psex, count(psex) from persons group by psex;
+------+-------------+
| psex | count(psex) |
+------+-------------+
| M    |           5 |
| F    |           1 |
+------+-------------+
2 rows in set

mysql> select * from movies ; 
+-----+---------------------+-------+
| mid | mtitle              | myear |
+-----+---------------------+-------+
|   1 | Rear Window         |  1954 |
|   2 | To Catch A Thief    |  1955 |
|   3 | The Maltese Falcon  |  1941 |
|   4 | The Birds           |  1963 |
|   5 | North By North West |  1959 |
|   6 | Casablanka          |  1942 |
|   7 | Anatomy of A Murder |  1959 |
+-----+---------------------+-------+
7 rows in set

mysql> select * from roles;
 
+-----+-----+------+
| mid | pid | role |
+-----+-----+------+
|   1 |   1 | D    |
|   1 |   3 | A    |
|   1 |   6 | A    |
|   2 |   1 | D    |
|   2 |   2 | A    |
|   2 |   3 | A    |
|   3 |   4 | A    |
|   3 |   5 | A    |
|   4 |   1 | D    |
|   5 |   1 | D    |
|   5 |   2 | A    |
|   6 |   4 | A    |
+-----+-----+------+
12 rows in set
mysql> select * from movies, roles where movies.mid=roles.mid; 
+-----+---------------------+-------+-----+-----+------+
| mid | mtitle              | myear | mid | pid | role |
+-----+---------------------+-------+-----+-----+------+
|   1 | Rear Window         |  1954 |   1 |   1 | D    |
|   1 | Rear Window         |  1954 |   1 |   3 | A    |
|   1 | Rear Window         |  1954 |   1 |   6 | A    |
|   2 | To Catch A Thief    |  1955 |   2 |   1 | D    |
|   2 | To Catch A Thief    |  1955 |   2 |   2 | A    |
|   2 | To Catch A Thief    |  1955 |   2 |   3 | A    |
|   3 | The Maltese Falcon  |  1941 |   3 |   4 | A    |
|   3 | The Maltese Falcon  |  1941 |   3 |   5 | A    |
|   4 | The Birds           |  1963 |   4 |   1 | D    |
|   5 | North By North West |  1959 |   5 |   1 | D    |
|   5 | North By North West |  1959 |   5 |   2 | A    |
|   6 | Casablanka          |  1942 |   6 |   4 | A    |
+-----+---------------------+-------+-----+-----+------+
12 rows in set

mysql> select * from persons, roles where persons.pid=roles.pid; 
+-----+--------------------+------+------------+-----+-----+------+
| pid | pname              | psex | pdob       | mid | pid | role |
+-----+--------------------+------+------------+-----+-----+------+
|   1 | Alfred Hitchcock   | M    | 1899-08-13 |   1 |   1 | D    |
|   3 | Grace Kelly        | F    | 1929-11-12 |   1 |   3 | A    |
|   6 | James stewart      | M    | 1908-05-20 |   1 |   6 | A    |
|   1 | Alfred Hitchcock   | M    | 1899-08-13 |   2 |   1 | D    |
|   2 | Cary Grant         | M    | 1904-01-18 |   2 |   2 | A    |
|   3 | Grace Kelly        | F    | 1929-11-12 |   2 |   3 | A    |
|   4 | Humphery Bogart    | M    | 1899-12-25 |   3 |   4 | A    |
|   5 | Sydney Greenstreet | M    | 1879-12-27 |   3 |   5 | A    |
|   1 | Alfred Hitchcock   | M    | 1899-08-13 |   4 |   1 | D    |
|   1 | Alfred Hitchcock   | M    | 1899-08-13 |   5 |   1 | D    |
|   2 | Cary Grant         | M    | 1904-01-18 |   5 |   2 | A    |
|   4 | Humphery Bogart    | M    | 1899-12-25 |   6 |   4 | A    |
+-----+--------------------+------+------------+-----+-----+------+
12 rows in set

mysql> select h.pname as fullname from persons as h;
+--------------------+
| fullname           |
+--------------------+
| Alfred Hitchcock   |
| Cary Grant         |
| Grace Kelly        |
| Humphery Bogart    |
| Sydney Greenstreet |
| James stewart      |
+--------------------+
6 rows in set

mysql> select h.pname as MYname from persons as h;
+--------------------+
| MYname             |
+--------------------+
| Alfred Hitchcock   |
| Cary Grant         |
| Grace Kelly        |
| Humphery Bogart    |
| Sydney Greenstreet |
| James stewart      |
+--------------------+
6 rows in set

mysql> create user fazumia@localhost identified by '1234';
1227 - Access denied; you need (at least one of) the CREATE USER privilege(s) for this operation
mysql> 
