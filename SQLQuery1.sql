create database movieDatabase;
use movieDatabase;

-- ========= Table Actor ============

    create table actor
	(
	act_id int primary key,
	act_Fname varchar(20),
	act_Lname varchar(20),
	act_gender char(1)
	);

-- ========= Table director ============

	create table director
	(
	dir_id int primary key ,
    dir_Fname varchar(20) ,
    dir_Lname varchar(20)
	);

-- ========= Table movie ============

	create table movie
	(
	mov_id int primary key,
	mov_title varchar(50),
	mov_year int ,
	mov_time int ,
	mov_lang varchar(50) ,
	mov_dt_rel date ,
	mov_rel_country varchar(5)
	);

-- ========= Table movie_direction ============

	create table movie_direction
	(
	dir_id int references director (dir_id) ,
	mov_id int references movie (mov_id) ,
	primary key(dir_id,mov_id) 
	);

-- ========= Table movie_cast ============

	create table movie_cast
	(
	act_id int references actor (act_id) ,
	mov_id int references movie (mov_id),
	role varchar(30) ,
	primary key(act_id,mov_id) 
	);

-- ========= Table reviewer ============

	create table reviewer
	(
	rev_id int ,
	rev_name varchar(30) ,
	primary key(rev_id)
	);

-- ========= Table genres ============

	create table genres
	(
	gen_id int ,
	gen_title varchar(20) ,
	primary key(gen_id)
	);

-- ========= Table movie_genres ============

	create table movie_genres
	(
	mov_id int references movie (mov_id) ,
	gen_id int references genres(gen_id) ,
	primary key(mov_id,gen_id) 
	);

-- ========= Table rating ============

	create table rating
	(
	mov_id int  references movie (mov_id) ,
	rev_id int  references reviewer(rev_id) ,
	rev_stars int ,
	num_o_ratings int ,
	primary key(mov_id,rev_id) 
	);

