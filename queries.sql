-- Aileen Do
-- Haydar Mahdi
-- CSCI4125

/* QUERIES */

/* 1. List a company's workers by names, */

SELECT  per_id, name
FROM    person NATURAL JOIN works NATURAL JOIN job
WHERE   comp_id = 3333303 AND end_date IS NULL;


/* 2. List a company's staff by salary in descending order. */
-- pay_type = 1 for salary, 1920 for wage

SELECT    per_id, name
FROM      person NATURAL JOIN works NATURAL JOIN job
WHERE     comp_id = 3333303 AND pay_type = 1 AND end_date IS NULL
ORDER BY  pay_rate DESC; 


/* 3. List companies' labor cost (total salaries and wage rates by 1920 hours) in descending order. */
-- pay_type = 1 for salary, 1920 for wage

SELECT    comp_id, comp_name, SUM (current_pay_rate * pay_type) AS labor_cost
FROM      job NATURAL JOIN works NATURAL JOIN company
WHERE     end_date IS NULL
GROUP BY  comp_id, comp_name
ORDER BY  labor_cost DESC;


/* 4. Find all the jobs a person is currently holding and worked in the past. */

SELECT  job_code, title
FROM    works NATURAL JOIN job
WHERE   per_id = 1111101;


/* 5. List a person's knowledge/skills in a readable format. */

SELECT  ks_code, description
FROM    knowledge_skill NATURAL JOIN has_skill
WHERE   per_id = 1111102;


/* 6. List the skill gap of a worker between his/her job(s) and his/her skills. */
--FIX WORKS INSERTS
SELECT  ks_code, description
FROM    required_skill NATURAL JOIN works NATURAL JOIN knowledge_skill
WHERE   per_id = 1111106 AND end_date IS NULL
MINUS
SELECT  ks_code, description
FROM    has_skill NATURAL JOIN knowledge_skill
WHERE   per_id = 1111106;


/* 7. List the required knowledge/skills of a job/a job category in a readable format (2 queries). */

SELECT  ks_code, description
FROM    knowledge_skill NATURAL JOIN required_skill
WHERE   job_code = 2222210;

--

SELECT  ks_code, description
FROM    knowledge_skill NATURAL JOIN skill_set
WHERE   cate_code = '15-1134';


/* 8. List a person's missing knowledge/skills for a specific job in a readable format. */

SELECT      ks_code, description
FROM        knowledge_skill NATURAL JOIN (
  SELECT    ks_code
  FROM      required_skill
  WHERE     job_code = 2222210
  MINUS
  SELECT    ks_code
  FROM      has_skill
  WHERE     per_id = 1111105);


/* 9. List the courses (course_id and title) that each alone teaches all the missing knowledge/skills for a person to pursue a specific job. */

WITH missing_skill AS (
  SELECT    ks_code
  FROM      required_skill
  WHERE     job_code = 2222204
  MINUS
  SELECT    ks_code
  FROM      has_skill
  WHERE     per_id = 1111103)
 
SELECT      c_code, title
FROM        course C
WHERE NOT EXISTS (
  SELECT    *
  FROM      missing_skill
  MINUS
  SELECT    ks_code
  FROM      teaches_skill T
  WHERE     T.c_code = C.c_code);
  

/* 10. Suppose the skill gap of a worker and the requirement of a desired job can be covered by one course. Find the "quickest" solution for this worker. Show the course, section information, and the completion date. */
       
WITH missing_skill AS (
  SELECT    ks_code
  FROM      required_skill
  WHERE     job_code = 2222203
  MINUS
  SELECT    ks_code
  FROM      has_skill
  WHERE     per_id = 1111101),
 
course_needed AS (
  SELECT    c_code, sec_no, complete_date
  FROM      section S
  WHERE NOT EXISTS (
    SELECT  *
    FROM    missing_skill
    MINUS
    SELECT  ks_code
    FROM    teaches_skill T
    WHERE   T.c_code = S.c_code))
 
SELECT      c_code, sec_no, title, complete_date
FROM        course_needed NATURAL JOIN course
WHERE       complete_date = (SELECT MIN (complete_date) FROM course_needed);
 

/* 11. Find the cheapest course to make up one's skill gap by showing the course to take and the cost (of the section price). */

WITH missing_skill AS (
  SELECT    ks_code
  FROM      required_skill
  WHERE     job_code = 2222205
  MINUS
  SELECT    ks_code
  FROM      has_skill
  WHERE     per_id = 1111102),
 
course_needed AS (
  SELECT    c_code, sec_no, price
  FROM      section S
  WHERE NOT EXISTS (
    SELECT  *
    FROM    missing_skill
    MINUS
    SELECT  ks_code
    FROM    teaches_skill T
    WHERE   T.c_code = S.c_code))
 
SELECT      c_code, sec_no, title, price
FROM        course_needed NATURAL JOIN course
WHERE       price = (SELECT MIN (price) FROM course_needed);


/* 12. If Q9 returns nothing, then find the course sets that their combination covers all the missing knowledge/skills for a person to pursue a specific job. The considered course sets will not include more than three courses. If multiple course sets are found, list the course sets (with their course IDs) in the order of the ascending order of the course sets' total cost. */

/*
drop table all_possible_course_sets cascade constraints;
drop sequence set_seq
*/
-- Create table
CREATE TABLE all_possible_course_sets
  (set_id integer not null,
   c_code1 integer,
   c_code2 integer,
   c_code3 integer,
   total_price numeric(8,2),
   primary key (set_id)
  );

-- Create sequence
CREATE SEQUENCE set_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE;

-- All possible course set combinations
INSERT INTO all_possible_course_sets
  SELECT set_seq.NEXTVAL, c_code, NULL, NULL, retail_price
  FROM course;

INSERT INTO all_possible_course_sets
  SELECT set_seq.NEXTVAL, C.c_code, D.c_code, NULL, (C.retail_price + D.retail_price)
  FROM course C, course D
  WHERE C.c_code < D.c_code;

INSERT INTO all_possible_course_sets
  SELECT set_seq.NEXTVAL, C.c_code, D.c_code, E.c_code, (C.retail_price + D.retail_price + E.retail_price)
  FROM course C,course D, course E
  WHERE C.c_code < D.c_code AND D.c_code < E.c_code;


-- Query starts here!
-- Skills missing for a particular job for a specific person
WITH missing_skills AS (
  SELECT    ks_code
  FROM      required_skill
  WHERE     job_code = 2222210
  MINUS
  SELECT    ks_code
  FROM      has_skill
  WHERE     per_id = 1111105),

-- All possible courses that teach all missing skills/check retail price
courses_teach_skills AS (
  SELECT    ks_code, c_code, retail_price
  FROM      missing_skills NATURAL JOIN teaches_skill NATURAL JOIN course),

-- All possible course sets that teach some of the missing skills
course_sets_teach_skills AS (
  SELECT    set_id, c_code1, c_code2, c_code3, ks_code
  FROM (
    SELECT  set_id, c_code1, c_code2, c_code3, ks_code
    FROM    all_possible_course_sets INNER JOIN courses_teach_skills
    ON      all_possible_course_sets.c_code1 = courses_teach_skills.c_code
    UNION
    SELECT  set_id, c_code1, c_code2, c_code3, ks_code
    FROM    all_possible_course_sets INNER JOIN courses_teach_skills
    ON      all_possible_course_sets.c_code2 = courses_teach_skills.c_code
    UNION
    SELECT  set_id, c_code1, c_code2, c_code3, ks_code
    FROM    all_possible_course_sets INNER JOIN courses_teach_skills
    ON      all_possible_course_sets.c_code3 = courses_teach_skills.c_code)),

cover_course_sets AS (
  SELECT    set_id, total_price
  FROM      all_possible_course_sets CS
  WHERE NOT EXISTS (
    SELECT  ks_code
    FROM    missing_skills
    MINUS
    SELECT  ks_code
    FROM    course_sets_teach_skills CST
    WHERE   CST.set_id = CS.set_id))
    
SELECT      set_id, c_code1, c_code2, c_code3, total_price
FROM        cover_course_sets NATURAL JOIN all_possible_course_sets
ORDER BY    total_price ASC;


/* 13. List all of the job categories that a person is qualified for. */

SELECT    cate_code, title
FROM      job_category J
WHERE NOT EXISTS (
  SELECT  ks_code
  FROM    skill_set S
  WHERE   S.cate_code = J.cate_code
  MINUS
  SELECT  ks_code
  FROM    has_skill
  WHERE   per_id = 1111108);


/* 14. Find the job with the highest pay rate for a person according to his/her skill qualification. */
-- Test case 1: per_id = 1111106; Expected output: job_code = 2222202, 2222204
-- Test case 2: per_id = 1111108; Expected output: job_code = 2222208

WITH qualified_job_skills AS (
  SELECT    job_code, title, (current_pay_rate * pay_type) AS pay_rate
  FROM      job J
  WHERE NOT EXISTS (
    SELECT  ks_code
    FROM    required_skill R
    WHERE   R.job_code = J.job_code
    MINUS
    SELECT  ks_code
    FROM    has_skill
    WHERE   per_id = 1111106)
  AND NOT EXISTS (
    SELECT  cert_code
    FROM    required_cert C
    WHERE   C.job_code = J.job_code
    MINUS
    SELECT  cert_code
    FROM    has_cert
    WHERE   per_id = 1111106))

SELECT      job_code, title, pay_rate
FROM        qualified_job_skills
WHERE       pay_rate = (SELECT MAX (pay_rate) FROM qualified_job_skills);


/* 15. List all the names along with the emails of the persons who are qualified or a job. */

SELECT    per_id, name, email
FROM      person P
WHERE NOT EXISTS (
  SELECT  ks_code
  FROM    required_skill
  WHERE   job_code = 2222204
  MINUS
  SELECT  ks_code
  FROM    has_skill S
  WHERE   P.per_id = S.per_id)
AND NOT EXISTS (
  SELECT  cert_code
  FROM    required_cert
  WHERE   job_code = 2222204
  MINUS
  SELECT  cert_code
  FROM    has_cert C
  WHERE   P.per_id = C.per_id);


/* 16. When a company cannot find any qualified person for a job, a secondary solution is to find a person who is almost qualified for to the job. Make a "missing-one" list that lists people who miss only one skill for a specified job. */
--FIX INSERTS IN HAS_SKILL/REQUIRED_SKILL, MAKE HAS_SKILL ODD
WITH job_skills_required AS (
  SELECT    ks_code
  FROM      required_skill
  WHERE     job_code = 2222202)

SELECT      per_id, name
FROM        person P
WHERE (
  SELECT COUNT(*)
  FROM (
    SELECT  ks_code
    FROM    job_skills_required
    MINUS
    SELECT  ks_code
    FROM    has_skill S
    WHERE   P.per_id = S.per_id)) = 1;


/* 17. List the ks_code and the number of people in the missing-one list for a given job code in the ascending order of the people counts. */
--FIX INSERTS IN HAS_SKILL/REQUIRED_SKILL
WITH required_list AS (
  SELECT ks_code
  FROM required_skill
  WHERE job_code = 2222205),

missing_one AS (
  SELECT      per_id, name
  FROM        person P
  WHERE (
    SELECT COUNT(*)
    FROM (
      SELECT  ks_code
      FROM    required_list
      MINUS
      SELECT  ks_code
      FROM    has_skill S
      WHERE   P.per_id = S.per_id)) = 1)

SELECT        ks_code, COUNT(*) AS people_count
FROM (
  SELECT      per_id, ks_code
  FROM        person, required_list
  MINUS
  SELECT      *
  FROM        has_skill) NATURAL JOIN missing_one
GROUP BY      ks_code
ORDER BY      people_count;


/* 18. Suppose there is a new job that has nobody qualified. List the persons who miss the least number of skills and report the least number. */

WITH required_list AS (
  SELECT    ks_code
  FROM      required_skill
  WHERE     job_code = 2222204),

missing_skill (per_id, missing_count) AS (
  SELECT    per_id, COUNT(*)
  FROM (
    SELECT  per_id, ks_code
    FROM    person, required_list
    MINUS
    SELECT  per_id, ks_code
    FROM    has_skill)
  GROUP BY  per_id)

SELECT      per_id, missing_count AS least_missing
FROM        missing_skill
WHERE       missing_count = (SELECT MIN (missing_count) FROM missing_skill);


/* 19. For a specified job category and a given small number k, make a "missing-k" list that lists the people's IDs and the number of missing skills for the people who miss only up to k skills in the ascending order of missing skills. */
       
WITH job_skills_required AS (
  SELECT    ks_code
  FROM      skill_set
  WHERE     cate_code = '15-1134'),

missing_skill (per_id, name, missing_skill_count) AS (
  SELECT    per_id, name, COUNT(*)
  FROM (
    SELECT  per_id, name, ks_code
    FROM    person NATURAL JOIN job_skills_required
    MINUS
    SELECT  per_id, name, ks_code
    FROM    has_skill NATURAL JOIN person)
  GROUP BY  per_id, name)

SELECT      per_id, name, missing_skill_count
FROM        missing_skill
WHERE       missing_skill_count <= 3
ORDER BY    missing_skill_count ASC;


/* 20. Given a job category code and its corresponding missing-k list specified in Q19, find every skill that is needed by at least one person in the given missing-k list. List each skillID and the number of people who need it in the descending order of the people counts. */
-- Test case 1: cate_code = 15-1131
-- Test case 2: cate_code = 15-1141

 WITH job_skills_required AS (
  SELECT    ks_code
  FROM      skill_set
  WHERE     cate_code = '15-1143'),
  
missing_skill (per_id, missing_count) AS (
  SELECT    per_id, COUNT(*)
  FROM (
    SELECT  per_id, ks_code
    FROM    person NATURAL JOIN job_skills_required
    MINUS
    SELECT  per_id, ks_code
    FROM    has_skill)
  GROUP BY  per_id)

SELECT      per_id, missing_count AS least_missing_skill
FROM        missing_skill
WHERE       missing_count = (SELECT MIN (missing_count) FROM missing_skill);


/* 21. In a local or national crisis, we need to find all the people who once held a job of the special job category identifier. */

SELECT  DISTINCT per_id, name
FROM    person NATURAL JOIN works NATURAL JOIN has_category
WHERE   cate_code = '15-1122';


/* 22. Find all the unemployed people who once held a job of the given job identifier. */

WITH unemployed_persons AS (
  SELECT  DISTINCT per_id, name
  FROM    works NATURAL JOIN person
  MINUS
  SELECT  DISTINCT per_id, name
  FROM    works NATURAL JOIN person
  WHERE   end_date IS NULL)

SELECT    per_id, name
FROM      unemployed_persons NATURAL JOIN works
WHERE     job_code = 2222207;


/* 23. Find out the biggest employer in terms of number of employees or the total amount of salaries and wages paid to employees. */
-- UPDATE IN PSTATEMENTS

WITH total_employees AS (
  SELECT    comp_id, COUNT(*) AS number_of_employees
  FROM      job NATURAL JOIN works
  WHERE     end_date IS NULL
  GROUP BY  comp_id)

SELECT      comp_id, comp_name, number_of_employees
FROM        total_employees NATURAL JOIN company
WHERE       number_of_employees = (SELECT MAX (number_of_employees) FROM total_employees);

--

WITH total_labor_costs AS (
  SELECT    comp_id, SUM (current_pay_rate * pay_type) AS labor_cost
  FROM      job NATURAL JOIN works
  WHERE     end_date IS NULL
  GROUP BY  comp_id)

SELECT      comp_id, comp_name, labor_cost
FROM        total_labor_costs NATURAL JOIN company
WHERE       labor_cost = (SELECT MAX (labor_cost) FROM total_labor_costs);


/* 24. Find out the job distribution among business sectors; find out the biggest sector in terms of number of employees or the total amount of salaries and wages paid to employees. */

WITH total_naics_employees AS (
  SELECT    naics_code, COUNT(*) AS number_of_employees
  FROM      job NATURAL JOIN company_naics NATURAL JOIN works
  WHERE     end_date is NULL
  GROUP BY  naics_code)

SELECT      naics_code, number_of_employees
FROM        total_naics_employees
WHERE       number_of_employees = (SELECT MAX (number_of_employees) FROM total_naics_employees);

--

WITH total_naics_costs AS (
  SELECT    naics_code, SUM (current_pay_rate * pay_type) AS labor_cost
  FROM      job NATURAL JOIN company_naics NATURAL JOIN works
  WHERE     end_date IS NULL
  GROUP BY  naics_code)

SELECT      naics_code, labor_cost
FROM        total_naics_costs
WHERE       labor_cost = (SELECT MAX (labor_cost) FROM total_naics_costs);


/* 25. Find out the ratio between the people whose earnings increase and those whose earning decrease; find the average rate of earning improvement for the workers in a specific business sector */
-- TEST CASE 1: naics_code = 611420
-- TEST CASE 2: naics_code = 541511

WITH past_job AS (
  SELECT      per_id, job_code, (pay_rate * pay_type) as past_rate
  FROM        works NATURAL JOIN job NATURAL JOIN (
    SELECT    per_id, MAX (end_date)
    FROM      works
    GROUP BY  per_id)),

current_job AS (
  SELECT      per_id, MAX (pay_rate * pay_type) AS current_rate
  FROM        works NATURAL JOIN job
  WHERE       end_date IS NULL
  GROUP BY    per_id)
  
SELECT        ROUND (num_increased / num_decreased, 2) AS ratio
FROM
  (SELECT      COUNT(*) AS num_decreased
  FROM        past_job NATURAL JOIN current_job
  WHERE       current_rate < past_rate),
  (SELECT      COUNT(*) as num_increased
  FROM        past_job NATURAL JOIN current_job
  WHERE       current_rate >= past_rate);

--

WITH past_job AS (
  SELECT      per_id, job_code, (pay_rate * pay_type) as past_rate
  FROM        works NATURAL JOIN job NATURAL JOIN (
    SELECT    per_id, MAX (end_date)
    FROM      works
    GROUP BY  per_id)),

current_job AS (
  SELECT      per_id, MAX (pay_rate * pay_type) AS current_rate
  FROM        works NATURAL JOIN job
  WHERE       end_date IS NULL
  GROUP BY    per_id),
  
past_current_job AS (
  SELECT      per_id, past_rate, current_rate
  FROM        past_job NATURAL JOIN current_job NATURAL JOIN job NATURAL JOIN company_naics
  WHERE       naics_code = 541511)

SELECT        ROUND (AVG ((current_rate - past_rate) / current_rate), 2) AS improved_rate
FROM          past_current_job;


/* 26. Find the leaf-node job categories that have the most openings due to lack of qualified workers. */
--FIX INSERTS HAS_CATEGORY
WITH vacant_jobs AS (
  SELECT      job_code, cate_code
  FROM        job NATURAL JOIN has_category
  MINUS
  SELECT      job_code, cate_code
  FROM        works NATURAL JOIN has_category
  WHERE       end_date IS NULL OR per_id IS NULL),

cate_jobs AS (
  SELECT      cate_code, COUNT (job_code) as openings
  FROM        vacant_jobs
  GROUP BY    cate_code),

cate_qualified AS (
  SELECT      cate_code, COUNT (per_id) AS qualified
  FROM        cate_jobs C, person P
  WHERE NOT EXISTS (
    SELECT    ks_code
    FROM      cate_jobs NATURAL JOIN skill_set
    WHERE     C.cate_code = cate_code
    MINUS
    SELECT    ks_code
    FROM      cate_jobs NATURAL JOIN skill_set NATURAL JOIN has_skill
    WHERE     P.per_id = per_id)
    GROUP BY  cate_code),

vacancy_diff AS (
  SELECT      cate_code, (openings - qualified) AS difference
  FROM        cate_jobs NATURAL JOIN cate_qualified)

SELECT        cate_code, difference AS openings_count
FROM          vacancy_diff
WHERE         difference = (SELECT MAX (difference) from vacancy_diff);


/* 27. Find the courses that can help most jobless people find a job by training them toward the jobs of this category that have the most openings due to lack of qualified workers. */
--FIX BASED ON 26
WITH vacant_jobs AS (
  SELECT      job_code, cate_code
  FROM        job NATURAL JOIN has_category
  MINUS
  SELECT      job_code, cate_code
  FROM        works NATURAL JOIN has_category
  WHERE       end_date IS NULL OR per_id IS NULL),

cate_jobs AS (
  SELECT      cate_code, COUNT (job_code) as openings
  FROM        vacant_jobs
  GROUP BY    cate_code),

cate_qualified AS (
  SELECT      cate_code, COUNT (per_id) AS qualified
  FROM        cate_jobs C, person P
  WHERE NOT EXISTS (
    SELECT    ks_code
    FROM      cate_jobs NATURAL JOIN skill_set
    WHERE     C.cate_code = cate_code
    MINUS
    SELECT    ks_code
    FROM      cate_jobs NATURAL JOIN skill_set NATURAL JOIN has_skill
    WHERE     P.per_id = per_id)
    GROUP BY  cate_code),

vacancy_diff AS (
  SELECT      cate_code, (openings - qualified) AS difference
  FROM        cate_jobs NATURAL JOIN cate_qualified),

max_openings_count AS (
  SELECT      cate_code, difference AS openings_count
  FROM        vacancy_diff
  WHERE       difference = (SELECT MAX (difference) from vacancy_diff)),

cate_skills AS (
  SELECT      ks_code
  FROM        skill_set NATURAL JOIN max_openings_count)

SELECT        c_code, title
FROM          course C
WHERE EXISTS (
  SELECT      ks_code
  FROM        cate_skills
  INTERSECT
  SELECT      ks_code
  FROM        teaches_skill T
  WHERE       C.c_code = T.c_code);


/* 28. List all the courses, directly or indirectly required, that a person has to take in order to be qualified for a job of the given category, according to his/her skills possessed and courses taken. */

CREATE TABLE all_possible_course_sets
  (set_id integer not null,
   c_code1 integer,
   c_code2 integer,
   c_code3 integer,
   total_price numeric(8,2),
   primary key (set_id)
  );

CREATE SEQUENCE set_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE;

INSERT INTO all_possible_course_sets
  SELECT set_seq.NEXTVAL, c_code, NULL, NULL, retail_price
  FROM course;

INSERT INTO all_possible_course_sets
  SELECT set_seq.NEXTVAL, C.c_code, D.c_code, NULL, (C.retail_price + D.retail_price)
  FROM course C, course D
  WHERE C.c_code < D.c_code;

INSERT INTO all_possible_course_sets
  SELECT set_seq.NEXTVAL, C.c_code, D.c_code, E.c_code, (C.retail_price + D.retail_price + E.retail_price)
  FROM course C,course D, course E
  WHERE C.c_code < D.c_code AND D.c_code < E.c_code;


-- Query starts here!
-- Skills missing for a particular job
WITH missing_skills AS (
  SELECT    ks_code
  FROM      skill_set
  WHERE     cate_code = '15-1133'
  MINUS
  SELECT    ks_code
  FROM      has_skill
  WHERE     per_id = 1111101),

-- All possible courses that teach all missing skills/check retail price
courses_teach_skills AS (
  SELECT    ks_code, c_code, retail_price
  FROM      missing_skills NATURAL JOIN teaches_skill NATURAL JOIN course),

-- All possible course sets that teach some of the missing skills
course_sets_teach_skills AS (
  SELECT    set_id, c_code1, c_code2, c_code3, ks_code
  FROM (
    SELECT  set_id, c_code1, c_code2, c_code3, ks_code
    FROM    all_possible_course_sets INNER JOIN courses_teach_skills
    ON      all_possible_course_sets.c_code1 = courses_teach_skills.c_code
    UNION
    SELECT  set_id, c_code1, c_code2, c_code3, ks_code
    FROM    all_possible_course_sets INNER JOIN courses_teach_skills
    ON      all_possible_course_sets.c_code2 = courses_teach_skills.c_code
    UNION
    SELECT  set_id, c_code1, c_code2, c_code3, ks_code
    FROM    all_possible_course_sets INNER JOIN courses_teach_skills
    ON      all_possible_course_sets.c_code3 = courses_teach_skills.c_code)),

cover_course_sets AS (
  SELECT    set_id, total_price
  FROM      all_possible_course_sets CS
  WHERE NOT EXISTS (
    SELECT  ks_code
    FROM    missing_skills
    MINUS
    SELECT  ks_code
    FROM    course_sets_teach_skills CST
    WHERE   CST.set_id = CS.set_id)),
    
minimum_course_set AS (
  SELECT    set_id, c_code1, c_code2, c_code3, total_price
  FROM      cover_course_sets NATURAL JOIN all_possible_course_sets
  WHERE     total_price = (SELECT MIN (total_price) FROM cover_course_sets NATURAL JOIN all_possible_course_sets)),

distinct_course_set AS (
  SELECT    set_id, c_code1, c_code2, c_code3, total_price
  FROM      minimum_course_set
  WHERE     set_id = (SELECT MIN (set_id) FROM minimum_course_set)),

course_set_table(c_code) AS (
  SELECT    c_code1 as c_code
  FROM      distinct_course_set
  UNION
  SELECT    c_code2 as c_code
  FROM      distinct_course_set
  UNION
  SELECT    c_code3 as c_code
  FROM      distinct_course_set),
  
courses_and_prereqs AS (
  SELECT    c_code, prereq_code
  FROM      course_set_table NATURAL JOIN has_prereq),

prerequisites(c_code, prereq_code) AS (
  SELECT    c_code, prereq_code
  FROM      courses_and_prereqs
  UNION ALL
  SELECT    prerequisites.c_code, prerequisites.prereq_code
  FROM      prerequisites, courses_and_prereqs
  WHERE     prerequisites.prereq_code = courses_and_prereqs.c_code),

distinct_prerequisites AS (
  SELECT    DISTINCT c_code
  FROM (
    SELECT  prereq_code AS c_code
    FROM    prerequisites
    UNION
    SELECT  c_code
    FROM    prerequisites))

SELECT      c_code
FROM        distinct_prerequisites
MINUS
SELECT      c_code
FROM        takes
WHERE       per_id = 1111101;
