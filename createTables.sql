/*
drop table person cascade constraints;
drop table phone cascade constraints;
drop table job cascade constraints;
drop table works cascade constraints;
drop table takes cascade constraints;
drop table has_cert cascade constraints;
drop table has_skill cascade constraints;
drop table has_category cascade constraints;
drop table required_cert cascade constraints;
drop table section cascade constraints;
drop table certificate cascade constraints;
drop table job_category cascade constraints;
drop table has_prereq cascade constraints;
drop table course cascade constraints;
drop table issued_by cascade constraints;
drop table grants_cert cascade constraints;
drop table has_parent cascade constraints;
drop table teaches_skill cascade constraints;
drop table knowledge_skill cascade constraints;
drop table skill_set cascade constraints;
drop table required_skill cascade constraints;
drop table preferred_skill cascade constraints;
drop table company cascade constraints;
drop table company_naics cascade constraints;
drop table naics cascade constraints;
*/


/**********************************
 * MAIN TABLES
 **********************************/
 
/* PERSON */
create table person
  (per_id integer,
   name varchar(50),
   apt_number integer,
   street_number varchar(7),
   street_name varchar(30),
   city varchar(30),
   state varchar(2),
   zip_code varchar(5),
   email varchar(50),
   gender varchar(1),
   primary key (per_id)
  );
  
/* COMPANY */
create table company
  (comp_id integer,
   comp_name varchar(30),
   street_number varchar(7),
   street_name varchar(30),
   city varchar(30),
   state varchar(2),
   zip_code varchar(5),
   primary_sector varchar(30),
   website varchar(255),
   primary key (comp_id)
  );

/* JOB */
create table job
  (job_code integer,
   title varchar(50),
   comp_id integer,
   emp_mode varchar(20),
   current_pay_rate numeric(10,2),
   pay_type integer,
   primary key (job_code),
   foreign key (comp_id) references company
  );
  
/* COURSE */
create table course
  (c_code integer,
   title varchar(30),
   difficulty varchar(10),
   description varchar(255),
   status varchar(7),
   retail_price numeric(10,2),
   primary key (c_code)
  );
  
/* SECTION */
create table section
  (c_code integer,
   sec_no varchar(3),
   year numeric(4,0),
   complete_date date,
   offered_by varchar(30),
   format varchar(30),
   price numeric(10,2),
   primary key (c_code, sec_no, year),
   foreign key (c_code) references course
  );
  
/* KNOWLEDGE_SKILL */
create table knowledge_skill
  (ks_code integer,
   title varchar(30),
   description varchar(255),
   difficulty varchar(10),
   primary key (ks_code)
  );

/* JOB_CATEGORY */
create table job_category
  (cate_code varchar(7),
   title varchar(100),
   description varchar(255),
   pay_range_high numeric(10,2),
   pay_range_low numeric(10,2),
   parent_cate integer,
   primary key (cate_code)
  );

/* CERTIFICATE */
create table certificate
  (cert_code integer,
   title varchar(30),
   description varchar(255),
   expire_date date,
   primary key (cert_code)
  );

/* NAICS */
create table naics
  (naics_code integer,
   title varchar(100),
   primary key (naics_code)
  );

/* PHONE */
create table phone
  (per_id integer,
   phone varchar(10),
   type varchar(10),
   primary key (phone),
   foreign key (per_id) references person
  );
   


/**********************************
 * RELATIONSHIP TABLES
 **********************************/

/* WORKS */
create table works
  (job_code integer,
   per_id integer,
   start_date date,
   end_date date,
   pay_rate numeric(10,2),
   primary key (job_code, per_id, start_date),
   foreign key (job_code) references job,
   foreign key (per_id) references person
  );
  
/* TAKES */
create table takes
  (per_id integer,
   c_code integer,
   sec_no varchar(3),
   year numeric(4,0),
   foreign key (per_id) references person,
   foreign key (c_code, sec_no, year) references section
  );

/* HAS_SKILL */
create table has_skill
  (ks_code integer,
   per_id integer,
   foreign key (ks_code) references knowledge_skill,
   foreign key (per_id) references person
  );

/* HAS_CERT */
create table has_cert
  (cert_code integer,
   per_id integer,
   foreign key (cert_code) references certificate,
   foreign key (per_id) references person
  );

/* HAS_CATEGORY */
create table has_category
  (cate_code varchar(7),
   job_code integer,
   foreign key (cate_code) references job_category,
   foreign key (job_code) references job
  );

/* REQUIRED_CERT */
create table required_cert
  (job_code integer,
   cert_code integer,
   foreign key (job_code) references job,
   foreign key (cert_code) references certificate
  );
  
/* HAS_PREREQ */
create table has_prereq
  (c_code integer,
   prereq_code integer,
   foreign key (c_code) references course,
   foreign key (prereq_code) references course(c_code)
  );
  
/* TEACHES_SKILL */
create table teaches_skill
  (ks_code integer,
   c_code integer,
   foreign key (ks_code) references knowledge_skill,
   foreign key (c_code) references course
  );

/* SKILL_SET */
create table skill_set
  (ks_code integer,
   cate_code varchar(7),
   foreign key (ks_code) references knowledge_skill,
   foreign key (cate_code) references job_category
  );

/* REQUIRED_SKILL */
create table required_skill
  (job_code integer,
   ks_code integer,
   foreign key (job_code) references job,
   foreign key (ks_code) references knowledge_skill
  );

/* PREFERRED_SKILL */
create table preferred_skill
  (job_code integer,
   ks_code integer,
   foreign key (job_code) references job,
   foreign key (ks_code) references knowledge_skill
  );

/* ISSUED_BY */
create table issued_by
  (comp_id integer,
   cert_code integer,
   foreign key (comp_id) references company,
   foreign key (cert_code) references certificate
  );
  
/* GRANTS_CERT */
create table grants_cert
  (c_code integer,
   cert_code integer,
   foreign key (c_code) references course,
   foreign key (cert_code) references certificate
  );

/* HAS_PARENT */
create table has_parent
  (cate_code varchar(7),
   parent_cate integer,
   primary key (parent_cate),
   foreign key (cate_code) references job_category
  );

/* COMPANY_NAICS */
create table company_naics
  (comp_id integer,
   naics_code integer,
   foreign key (comp_id) references company,
   foreign key (naics_code) references naics
  );
