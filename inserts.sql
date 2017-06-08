/*
delete from person;
delete from phone;
delete from company;
delete from job;
delete from course;
delete from section;
delete from certificate;
delete from knowledge_skill;
delete from job_category;
delete from naics;
delete from takes;
delete from works;
delete from has_cert;
delete from has_skill;
delete from has_category;
delete from required_cert;
delete from issued_by;
delete from grants_cert;
delete from teaches_skill;
delete from skill_set;
delete from required_skill;
delete from preferred_skill;
delete from company_naics;
*/

/* PERSON INSERTS */
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111101, 'William Bradley', null, '8675', 'Reindahl Drive', 'Carol Stream', 'IL', '60351', 'wbradley0@bbc.co.uk', 'M');
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111102, 'Lawrence Cook', null, '1259', 'Longview Street', 'Fredericksburg', 'VA', '22405', 'lcook1@ifeng.com', 'M');
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111103, 'Julie Webb', 503, '5', 'Fulton Avenue', 'Washington', 'DC', '20205', 'jwebb2@google.co.jp', 'F');
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111104, 'James Elliott', 439, '4', 'Randy Road', 'Newark', 'NJ', '07188', 'jelliott3@ezinearticles.com', 'M');
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111105, 'Mildred Day', null, '1', 'Loeprich Street', 'Washington', 'DC', '20436', 'mday4@yelp.com', 'F');
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111106, 'Anna Gilbert', 23, '36', 'Spohn Parkway', 'Seattle', 'WA', '98185', 'agilbert5@lulu.com', 'F');
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111107, 'Ashley Harvey', null, '258', 'South Lane', 'Las Vegas', 'NV', '89166', 'aharvey6@indiatimes.com', 'F');
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111108, 'Harold Ford', null, '45', 'Lillian Drive', 'Salt Lake City', 'UT', '84189', 'hford7@japanpost.jp', 'M');
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111109, 'Rose Bryant', 789, '756', 'Kennedy Circle', 'Lynchburg', 'VA', '24515', 'rbryant8@sogou.com', 'F');
insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111110, 'Martin Walker', null, '14', 'Huxley Trail', 'San Francisco', 'CA', '94110', 'mwalker9@diigo.com', 'M');

/* PHONE INSERTS */
insert into phone (per_id, phone, type) values (1111101, '6271238963', 'Mobile');
insert into phone (per_id, phone, type) values (1111102, '2869744390', 'Mobile');
insert into phone (per_id, phone, type) values (1111103, '9518261074', 'Mobile');
insert into phone (per_id, phone, type) values (1111104, '7785042178', 'Mobile');
insert into phone (per_id, phone, type) values (1111105, '3055004558', 'Mobile');
insert into phone (per_id, phone, type) values (1111106, '3861929312', 'Office');
insert into phone (per_id, phone, type) values (1111107, '5328572948', 'Office');
insert into phone (per_id, phone, type) values (1111108, '5028542005', 'Mobile');
insert into phone (per_id, phone, type) values (1111109, '2004478544', 'Mobile');
insert into phone (per_id, phone, type) values (1111110, '6737292999', 'Home');

/* COMPANY INSERTS */
insert into company (comp_id, comp_name, street_number, street_name, city, state, zip_code, primary_sector, website) values (3333301, 'Facebook', '2021', 'Jay Court', 'Buffalo', 'NY', '14220', 'E-Commerce', 'facebook.com');
insert into company (comp_id, comp_name, street_number, street_name, city, state, zip_code, primary_sector, website) values (3333302, 'Amazon', '76', 'Chive Parkway', 'Houston', 'TX', '77085', 'E-Commerce', 'amazon.com');
insert into company (comp_id, comp_name, street_number, street_name, city, state, zip_code, primary_sector, website) values (3333303, 'Reddit', '3', 'Florence Road', 'Tuscaloosa', 'AL', '35405', 'Entertainment', 'reddit.com');
insert into company (comp_id, comp_name, street_number, street_name, city, state, zip_code, primary_sector, website) values (3333304, 'Mozilla', '75', 'Rieder Way', 'Reno', 'NV', '89510', 'Technology', 'mozilla.com');
insert into company (comp_id, comp_name, street_number, street_name, city, state, zip_code, primary_sector, website) values (3333305, 'Google', '36', 'Muir Trail', 'New Orleans', 'LA', '70174', 'Technology', 'google.com');

/* JOB INSERTS */
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222201, 'Help Desk Technician', 3333301, 'Part-time', 18, 1920); -- 1920 is wage
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222202, 'Desktop Support Technician', 3333302, 'Full-time', 21, 1920);
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222203, 'Technical Writer', 3333303, 'Full-time', 20, 1920);
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222204, 'Programmer', 3333304, 'Full-time', 21, 1920);
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222205, 'Project Manager', 3333305, 'Part-time', 19, 1920);
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222206, 'Software Test Engineer', 3333303, 'Part-time', 48000, 1); -- 1 is salary
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222207, 'Programmer Analyst', 3333304, 'Full-time', 83000, 1);
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222208, 'Systems Administrator', 3333304, 'Full-time', 90000, 1);
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222209, 'Systems Analyst', 3333305, 'Part-time', 37000, 1);
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222210, 'Senior Quality Engineer', 3333305, 'Full-time', 102000, 1);
insert into job (job_code, title, comp_id, emp_mode, current_pay_rate, pay_type) values (2222211, 'Chief Technology Officer', 3333305, 'Full-time', 192000, 1);

/* COURSE INSERTS */
insert into course (c_code, title, difficulty, description, status, retail_price) values (1500, 'Software Development I', 'advanced', 'Learn how to code', 'Active', 386);
insert into course (c_code, title, difficulty, description, status, retail_price) values (1850, 'Software Development II', 'beginner', 'Learn how to code', 'Active', 353);
insert into course (c_code, title, difficulty, description, status, retail_price) values (2200, 'Data Structures', 'beginner', 'Learn about systems', 'Active', 412);
insert into course (c_code, title, difficulty, description, status, retail_price) values (2550, 'Database Systems', 'medium', 'Develop skills', 'Expired', 481);
insert into course (c_code, title, difficulty, description, status, retail_price) values (2900, 'Operating Systems', 'medium', 'Develop skills', 'Active', 491);
insert into course (c_code, title, difficulty, description, status, retail_price) values (3250, 'Systems Programming', 'medium', 'Develop skills', 'Active', 458);
insert into course (c_code, title, difficulty, description, status, retail_price) values (3600, 'Artificial Intelligence', 'beginner', 'Develop skills', 'Active', 324);
insert into course (c_code, title, difficulty, description, status, retail_price) values (3950, 'Web Development I', 'beginner', 'Learn how to code', 'Active', 412);
insert into course (c_code, title, difficulty, description, status, retail_price) values (4300, 'Web Development II', 'beginner', 'Learn about systems', 'Expired', 426);
insert into course (c_code, title, difficulty, description, status, retail_price) values (4650, 'Mobile Applications', 'medium', 'Develop skills', 'Expired', 473);

/* SECTION INSERTS */
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (1500, '001', 2016, to_date('2016-10-29', 'yyyy-mm-dd'), 'Duncan', 'Online', 322);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (1500, '002', 2016, to_date('2016-04-14', 'yyyy-mm-dd'), 'Watson', 'Lecture', 400);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (1850, '001', 2016, to_date('2016-05-01', 'yyyy-mm-dd'), 'Sanchez', 'Online', 433);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (1850, '002', 2016, to_date('2016-06-18', 'yyyy-mm-dd'), 'Austin', 'Online', 345);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (2200, '001', 2016, to_date('2016-07-11', 'yyyy-mm-dd'), 'Hicks', 'Lecture', 374);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (2200, '002', 2016, to_date('2016-08-30', 'yyyy-mm-dd'), 'Kim', 'Lecture', 299);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (2550, '001', 2016, to_date('2016-08-15', 'yyyy-mm-dd'), 'Price', 'Lecture', 389);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (2550, '002', 2016, to_date('2016-10-13', 'yyyy-mm-dd'), 'Thomas', 'Online', 436);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (2900, '001', 2016, to_date('2016-05-21', 'yyyy-mm-dd'), 'Roberts', 'Lecture', 475);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (2900, '002', 2016, to_date('2016-12-08', 'yyyy-mm-dd'), 'Stephens', 'Lecture', 342);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (3250, '001', 2016, to_date('2016-03-26', 'yyyy-mm-dd'), 'Long', 'Lecture', 378);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (3250, '002', 2016, to_date('2016-01-26', 'yyyy-mm-dd'), 'Sanders', 'Lecture', 399);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (3600, '001', 2016, to_date('2016-09-09', 'yyyy-mm-dd'), 'Sims', 'Lecture', 401);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (3600, '002', 2016, to_date('2016-11-23', 'yyyy-mm-dd'), 'Gray', 'Online', 410);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (3950, '001', 2016, to_date('2016-11-07', 'yyyy-mm-dd'), 'Chapman', 'Online', 377);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (3950, '002', 2016, to_date('2016-09-10', 'yyyy-mm-dd'), 'Webb', 'Lecture', 400);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (4300, '001', 2016, to_date('2016-06-14', 'yyyy-mm-dd'), 'Cruz', 'Online', 422);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (4300, '002', 2016, to_date('2016-03-25', 'yyyy-mm-dd'), 'Lee', 'Lecture', 450);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (4650, '001', 2016, to_date('2016-04-05', 'yyyy-mm-dd'), 'Simmons', 'Online', 367);
insert into section (c_code, sec_no, year, complete_date, offered_by, format, price) values (4650, '002', 2016, to_date('2016-05-23', 'yyyy-mm-dd'), 'Diaz', 'Lecture', 355);

/* CERTIFICATE INSERTS */
insert into certificate (cert_code, title, description, expire_date) values (5555501, 'CCENT', 'Cisco Certified Entry Networking Technician', to_date('2018-04-01', 'yyyy-mm-dd'));
insert into certificate (cert_code, title, description, expire_date) values (5555502, 'CCNA', 'Cisco Certified Network Associate', to_date('2017-09-18', 'yyyy-mm-dd'));
insert into certificate (cert_code, title, description, expire_date) values (5555503, 'CCDA', 'Cisco Certified Design Associate', to_date('2018-02-19', 'yyyy-mm-dd'));
insert into certificate (cert_code, title, description, expire_date) values (5555504, 'CCNP', 'Cisco Certified Network Professional', to_date('2017-09-18', 'yyyy-mm-dd'));
insert into certificate (cert_code, title, description, expire_date) values (5555505, 'CCSP', 'Cisco Certified Security Professional', to_date('2018-03-17', 'yyyy-mm-dd'));
insert into certificate (cert_code, title, description, expire_date) values (5555506, 'CompTIA A+', 'A+ Certified', to_date('2018-03-02', 'yyyy-mm-dd'));
insert into certificate (cert_code, title, description, expire_date) values (5555507, 'CompTIA Network+', 'Network+ Certified', to_date('2017-11-17', 'yyyy-mm-dd'));
insert into certificate (cert_code, title, description, expire_date) values (5555508, 'CompTIA Security+', 'Security+ Certified', to_date('2017-08-08', 'yyyy-mm-dd'));
insert into certificate (cert_code, title, description, expire_date) values (5555509, 'MCSE', 'Microsoft Certified Systems Engineer', to_date('2017-08-31', 'yyyy-mm-dd'));
insert into certificate (cert_code, title, description, expire_date) values (5555510, 'MCSA', 'Microsoft Certified Systems Administrator', to_date('2018-01-17', 'yyyy-mm-dd'));

/* KNOWLEDGE_SKILL INSERTS */
insert into knowledge_skill (ks_code, description, difficulty) values (4444401, 'Windows Server', 'medium');
insert into knowledge_skill (ks_code, description, difficulty) values (4444402, 'Google AdWords', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444403, 'jQuery', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444404, 'Relational DataBase Management System (RDBMS)', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444405, 'Adobe Indesign', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444406, 'SQL Server Reporting Services (SSRS)', 'advanced');
insert into knowledge_skill (ks_code, description, difficulty) values (4444407, 'Java', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444408, 'Meditech', 'advanced');
insert into knowledge_skill (ks_code, description, difficulty) values (4444409, 'Platform as a Service (PaaS)', 'advanced');
insert into knowledge_skill (ks_code, description, difficulty) values (4444410, 'Data Visualization', 'advanced');
insert into knowledge_skill (ks_code, description, difficulty) values (4444411, 'Meditech', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444412, 'Swift', 'advanced');
insert into knowledge_skill (ks_code, description, difficulty) values (4444413, 'Bugzilla', 'medium');
insert into knowledge_skill (ks_code, description, difficulty) values (4444414, 'Ruby on Rails', 'medium');
insert into knowledge_skill (ks_code, description, difficulty) values (4444415, 'Transact-SQL', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444416, 'LexisNexis', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444417, 'VBScript', 'advanced');
insert into knowledge_skill (ks_code, description, difficulty) values (4444418, 'Extensible Stylesheet Language XSL', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444419, 'JavaBeans', 'beginner');
insert into knowledge_skill (ks_code, description, difficulty) values (4444420, 'Wireshark', 'beginner');

/* JOB_CATEGORY INSERTS*/
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1111', 'Computer and Information Research Scientists', 'Some description here!', 108000, 51000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1121', 'Computer Systems Analysts', 'Some description here!', 96000, 45000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1122', 'Information Security Analysts', 'Some description here!', 94000, 48000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1131', 'Computer Programmers', 'Some description here!', 124000, 45000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1132', 'Software Developers (Applications)', 'Some description here!', 76000, 58000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1133', 'Software Developers (Systems Software)', 'Some description here!', 75000, 55000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1134', 'Web Developers', 'Some description here!', 83000, 45000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1141', 'Database Administrators', 'Some description here!', 95000, 57000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1142', 'Network and Computer Systems Administrators', 'Some description here!', 118000, 59000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1143', 'Computer Network Architects', 'Some description here!', 103000, 53000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1151', 'Computer User Support Specialists', 'Some description here!', 82000, 52000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1152', 'Computer Network Support Specialists', 'Some description here!', 115000, 50000, 15);
insert into job_category (cate_code, title, description, pay_range_high, pay_range_low, parent_cate) values ('15-1199', 'Computer Occupations (All Other)', 'Some description here!', 120000, 54000, 15);

/* NAICS INSERTS */
insert into naics (naics_code, title) values (511210, 'Applications development and publishing');
/*insert into naics (naics_code, title) values (511210, 'Applications software');
insert into naics (naics_code, title) values (511210, 'Computer software publishers');
insert into naics (naics_code, title) values (511210, 'Games');
insert into naics (naics_code, title) values (511210, 'Operating systems software');
insert into naics (naics_code, title) values (511210, 'Packaged computer software publishers');
insert into naics (naics_code, title) values (511210, 'Programming language and compiler software publishers');
insert into naics (naics_code, title) values (511210, 'Software computer');
insert into naics (naics_code, title) values (511210, 'Software publishers');*/
insert into naics (naics_code, title) values (518210, 'Application hosting');
/*insert into naics (naics_code, title) values (518210, 'Automated data processing services');
insert into naics (naics_code, title) values (518210, 'Computer data storage services');
insert into naics (naics_code, title) values (518210, 'Computer input preparation services');*/
insert into naics (naics_code, title) values (541511, 'Applications software programming services');
/*insert into naics (naics_code, title) values (541511, 'Computer program or software development');
insert into naics (naics_code, title) values (541511, 'Computer programming services');
insert into naics (naics_code, title) values (541511, 'Software analysis and design services');
insert into naics (naics_code, title) values (541511, 'Software programming services');
insert into naics (naics_code, title) values (541511, 'Web page design services');*/
insert into naics (naics_code, title) values (541512, 'Local area network (LAN) computer systems integration design services');
/*insert into naics (naics_code, title) values (541512, 'Network systems integration design services');
insert into naics (naics_code, title) values (541512, 'Office automation computer systems integration design services');
insert into naics (naics_code, title) values (541512, 'Systems integration design consulting services');
insert into naics (naics_code, title) values (541512, 'Systems integration design services');*/
insert into naics (naics_code, title) values (611420, 'Computer programming schools');
/*insert into naics (naics_code, title) values (611420, 'Computer operator training');
insert into naics (naics_code, title) values (611420, 'Computer software training');
insert into naics (naics_code, title) values (611420, 'Computer training (except repair)');
insert into naics (naics_code, title) values (611420, 'Local area network (LAN) management training');*/


---------------------------------------------------------

/* TAKES INSERTS */
insert into takes (per_id, c_code, sec_no, year) values (1111101, 1500, '001', 2016);

insert into takes (per_id, c_code, sec_no, year) values (1111102, 1500, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111102, 1850, '002', 2016);

insert into takes (per_id, c_code, sec_no, year) values (1111103, 1500, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111103, 1850, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111103, 2200, '001', 2016);

insert into takes (per_id, c_code, sec_no, year) values (1111104, 1500, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111104, 1850, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111104, 2200, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111104, 2550, '002', 2016);

insert into takes (per_id, c_code, sec_no, year) values (1111105, 1500, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111105, 1850, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111105, 2200, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111105, 2550, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111105, 2900, '001', 2016);

insert into takes (per_id, c_code, sec_no, year) values (1111106, 1500, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111106, 1850, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111106, 2200, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111106, 2550, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111106, 2900, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111106, 3250, '002', 2016);

insert into takes (per_id, c_code, sec_no, year) values (1111107, 1500, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111107, 1850, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111107, 2200, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111107, 2550, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111107, 2900, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111107, 3250, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111107, 3600, '001', 2016);

insert into takes (per_id, c_code, sec_no, year) values (1111108, 1500, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111108, 1850, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111108, 2200, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111108, 2550, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111108, 2900, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111108, 3250, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111108, 3600, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111108, 3950, '002', 2016);

insert into takes (per_id, c_code, sec_no, year) values (1111109, 1500, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111109, 1850, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111109, 2200, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111109, 2550, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111109, 2900, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111109, 3250, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111109, 3600, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111109, 3950, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111109, 4300, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111109, 4650, '002', 2016);

insert into takes (per_id, c_code, sec_no, year) values (1111110, 1500, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111110, 1850, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111110, 2200, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111110, 2550, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111110, 2900, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111110, 3250, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111110, 3600, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111110, 3950, '002', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111110, 4300, '001', 2016);
insert into takes (per_id, c_code, sec_no, year) values (1111110, 4650, '002', 2016);

/* WORKS INSERTS */
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222201, 1111101, to_date('2016-10-06', 'yyyy-mm-dd'), null, 18);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222202, 1111101, to_date('2015-11-01', 'yyyy-mm-dd'), to_date('2016-02-03', 'yyyy-mm-dd'), 21);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222210, 1111101, to_date('2016-03-31', 'yyyy-mm-dd'), to_date('2016-08-17', 'yyyy-mm-dd'), 103000);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222202, 1111102, to_date('2016-10-08', 'yyyy-mm-dd'), null, 22);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222203, 1111103, to_date('2016-02-15', 'yyyy-mm-dd'), null, 23);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222204, 1111103, to_date('2015-07-10', 'yyyy-mm-dd'), to_date('2016-02-20', 'yyyy-mm-dd'), 21);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222204, 1111104, to_date('2016-03-07', 'yyyy-mm-dd'), null, 24);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222203, 1111104, to_date('2015-08-17', 'yyyy-mm-dd'), to_date('2015-12-17', 'yyyy-mm-dd'), 20);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222205, 1111105, to_date('2016-04-20', 'yyyy-mm-dd'), null, 20);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222206, 1111105, to_date('2015-05-16', 'yyyy-mm-dd'), to_date('2015-10-16', 'yyyy-mm-dd'), 49000);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222206, 1111106, to_date('2016-09-18', 'yyyy-mm-dd'), null, 50000);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222205, 1111106, to_date('2015-04-01', 'yyyy-mm-dd'), to_date('2015-05-01', 'yyyy-mm-dd'), 19);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222207, 1111106, to_date('2015-06-05', 'yyyy-mm-dd'), to_date('2015-08-17', 'yyyy-mm-dd'), 84000);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222208, 1111106, to_date('2015-09-05', 'yyyy-mm-dd'), to_date('2016-01-17', 'yyyy-mm-dd'), 92000);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222207, 1111107, to_date('2015-11-24', 'yyyy-mm-dd'), to_date('2017-03-01', 'yyyy-mm-dd'), 85000);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222208, 1111108, to_date('2016-03-07', 'yyyy-mm-dd'), to_date('2017-04-17', 'yyyy-mm-dd'), 93000);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222207, 1111108, to_date('2015-01-28', 'yyyy-mm-dd'), to_date('2015-05-19', 'yyyy-mm-dd'), 86000);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222209, 1111108, to_date('2015-06-25', 'yyyy-mm-dd'), to_date('2016-01-01', 'yyyy-mm-dd'), 94000);
insert into works (job_code, per_id, start_date, end_date, pay_rate) values (2222210, 1111110, to_date('2015-01-04', 'yyyy-mm-dd'), null, 105000);

/* HAS_CERT INSERTS */
insert into has_cert (per_id, cert_code) values (1111101, 5555510);
insert into has_cert (per_id, cert_code) values (1111101, 5555503);
insert into has_cert (per_id, cert_code) values (1111101, 5555506);
insert into has_cert (per_id, cert_code) values (1111101, 5555509);

insert into has_cert (per_id, cert_code) values (1111102, 5555505);

insert into has_cert (per_id, cert_code) values (1111103, 5555503);
insert into has_cert (per_id, cert_code) values (1111103, 5555501);
insert into has_cert (per_id, cert_code) values (1111103, 5555502);
insert into has_cert (per_id, cert_code) values (1111103, 5555506);
insert into has_cert (per_id, cert_code) values (1111103, 5555507);

insert into has_cert (per_id, cert_code) values (1111104, 5555505);
insert into has_cert (per_id, cert_code) values (1111104, 5555507);

insert into has_cert (per_id, cert_code) values (1111105, 5555506);
insert into has_cert (per_id, cert_code) values (1111105, 5555507);
insert into has_cert (per_id, cert_code) values (1111105, 5555509);

insert into has_cert (per_id, cert_code) values (1111106, 5555505);
insert into has_cert (per_id, cert_code) values (1111106, 5555502);
insert into has_cert (per_id, cert_code) values (1111106, 5555504);
insert into has_cert (per_id, cert_code) values (1111106, 5555510);
insert into has_cert (per_id, cert_code) values (1111106, 5555501);
insert into has_cert (per_id, cert_code) values (1111106, 5555503);

insert into has_cert (per_id, cert_code) values (1111107, 5555504);
insert into has_cert (per_id, cert_code) values (1111107, 5555508);

insert into has_cert (per_id, cert_code) values (1111108, 5555510);
insert into has_cert (per_id, cert_code) values (1111108, 5555507);
insert into has_cert (per_id, cert_code) values (1111108, 5555505);
insert into has_cert (per_id, cert_code) values (1111108, 5555509);
insert into has_cert (per_id, cert_code) values (1111108, 5555502);
insert into has_cert (per_id, cert_code) values (1111108, 5555501);
insert into has_cert (per_id, cert_code) values (1111108, 5555508);
insert into has_cert (per_id, cert_code) values (1111108, 5555506);
insert into has_cert (per_id, cert_code) values (1111108, 5555504);

insert into has_cert (per_id, cert_code) values (1111109, 5555505);

insert into has_cert (per_id, cert_code) values (1111110, 5555501);
insert into has_cert (per_id, cert_code) values (1111110, 5555502);
insert into has_cert (per_id, cert_code) values (1111110, 5555507);

/* HAS_SKILL INSERTS*/
insert into has_skill (ks_code, per_id) values (4444401, 1111101);
insert into has_skill (ks_code, per_id) values (4444402, 1111101);
insert into has_skill (ks_code, per_id) values (4444403, 1111101);

insert into has_skill (ks_code, per_id) values (4444401, 1111102);
insert into has_skill (ks_code, per_id) values (4444402, 1111102);
insert into has_skill (ks_code, per_id) values (4444403, 1111102);
insert into has_skill (ks_code, per_id) values (4444404, 1111102);

insert into has_skill (ks_code, per_id) values (4444401, 1111103);
insert into has_skill (ks_code, per_id) values (4444402, 1111103);
insert into has_skill (ks_code, per_id) values (4444403, 1111103);
insert into has_skill (ks_code, per_id) values (4444404, 1111103);
insert into has_skill (ks_code, per_id) values (4444405, 1111103);
insert into has_skill (ks_code, per_id) values (4444406, 1111103);

insert into has_skill (ks_code, per_id) values (4444401, 1111104);
insert into has_skill (ks_code, per_id) values (4444402, 1111104);
insert into has_skill (ks_code, per_id) values (4444403, 1111104);
insert into has_skill (ks_code, per_id) values (4444404, 1111104);
insert into has_skill (ks_code, per_id) values (4444405, 1111104);
insert into has_skill (ks_code, per_id) values (4444406, 1111104);
insert into has_skill (ks_code, per_id) values (4444407, 1111104);
insert into has_skill (ks_code, per_id) values (4444408, 1111104);

insert into has_skill (ks_code, per_id) values (4444401, 1111105);
insert into has_skill (ks_code, per_id) values (4444402, 1111105);
insert into has_skill (ks_code, per_id) values (4444403, 1111105);
insert into has_skill (ks_code, per_id) values (4444404, 1111105);
insert into has_skill (ks_code, per_id) values (4444405, 1111105);
insert into has_skill (ks_code, per_id) values (4444406, 1111105);
insert into has_skill (ks_code, per_id) values (4444407, 1111105);
insert into has_skill (ks_code, per_id) values (4444408, 1111105);
insert into has_skill (ks_code, per_id) values (4444409, 1111105);
insert into has_skill (ks_code, per_id) values (4444410, 1111105);

insert into has_skill (ks_code, per_id) values (4444401, 1111106);
insert into has_skill (ks_code, per_id) values (4444402, 1111106);
insert into has_skill (ks_code, per_id) values (4444403, 1111106);
insert into has_skill (ks_code, per_id) values (4444404, 1111106);
insert into has_skill (ks_code, per_id) values (4444405, 1111106);
insert into has_skill (ks_code, per_id) values (4444406, 1111106);
insert into has_skill (ks_code, per_id) values (4444407, 1111106);
insert into has_skill (ks_code, per_id) values (4444408, 1111106);
insert into has_skill (ks_code, per_id) values (4444409, 1111106);
insert into has_skill (ks_code, per_id) values (4444410, 1111106);
insert into has_skill (ks_code, per_id) values (4444411, 1111106);
insert into has_skill (ks_code, per_id) values (4444412, 1111106);

insert into has_skill (ks_code, per_id) values (4444401, 1111107);
insert into has_skill (ks_code, per_id) values (4444402, 1111107);
insert into has_skill (ks_code, per_id) values (4444403, 1111107);
insert into has_skill (ks_code, per_id) values (4444404, 1111107);
insert into has_skill (ks_code, per_id) values (4444405, 1111107);
insert into has_skill (ks_code, per_id) values (4444406, 1111107);
insert into has_skill (ks_code, per_id) values (4444407, 1111107);
insert into has_skill (ks_code, per_id) values (4444408, 1111107);
insert into has_skill (ks_code, per_id) values (4444409, 1111107);
insert into has_skill (ks_code, per_id) values (4444410, 1111107);
insert into has_skill (ks_code, per_id) values (4444411, 1111107);
insert into has_skill (ks_code, per_id) values (4444412, 1111107);
insert into has_skill (ks_code, per_id) values (4444413, 1111107);
insert into has_skill (ks_code, per_id) values (4444414, 1111107);

insert into has_skill (ks_code, per_id) values (4444401, 1111108);
insert into has_skill (ks_code, per_id) values (4444402, 1111108);
insert into has_skill (ks_code, per_id) values (4444403, 1111108);
insert into has_skill (ks_code, per_id) values (4444404, 1111108);
insert into has_skill (ks_code, per_id) values (4444405, 1111108);
insert into has_skill (ks_code, per_id) values (4444406, 1111108);
insert into has_skill (ks_code, per_id) values (4444407, 1111108);
insert into has_skill (ks_code, per_id) values (4444408, 1111108);
insert into has_skill (ks_code, per_id) values (4444409, 1111108);
insert into has_skill (ks_code, per_id) values (4444410, 1111108);
insert into has_skill (ks_code, per_id) values (4444411, 1111108);
insert into has_skill (ks_code, per_id) values (4444412, 1111108);
insert into has_skill (ks_code, per_id) values (4444413, 1111108);
insert into has_skill (ks_code, per_id) values (4444414, 1111108);
insert into has_skill (ks_code, per_id) values (4444415, 1111108);
insert into has_skill (ks_code, per_id) values (4444416, 1111108);

insert into has_skill (ks_code, per_id) values (4444401, 1111109);
insert into has_skill (ks_code, per_id) values (4444402, 1111109);
insert into has_skill (ks_code, per_id) values (4444403, 1111109);
insert into has_skill (ks_code, per_id) values (4444404, 1111109);
insert into has_skill (ks_code, per_id) values (4444405, 1111109);
insert into has_skill (ks_code, per_id) values (4444406, 1111109);
insert into has_skill (ks_code, per_id) values (4444407, 1111109);
insert into has_skill (ks_code, per_id) values (4444408, 1111109);
insert into has_skill (ks_code, per_id) values (4444409, 1111109);
insert into has_skill (ks_code, per_id) values (4444410, 1111109);
insert into has_skill (ks_code, per_id) values (4444411, 1111109);
insert into has_skill (ks_code, per_id) values (4444412, 1111109);
insert into has_skill (ks_code, per_id) values (4444413, 1111109);
insert into has_skill (ks_code, per_id) values (4444414, 1111109);
insert into has_skill (ks_code, per_id) values (4444415, 1111109);
insert into has_skill (ks_code, per_id) values (4444416, 1111109);
insert into has_skill (ks_code, per_id) values (4444417, 1111109);
insert into has_skill (ks_code, per_id) values (4444418, 1111109);

insert into has_skill (ks_code, per_id) values (4444401, 1111110);
insert into has_skill (ks_code, per_id) values (4444402, 1111110);
insert into has_skill (ks_code, per_id) values (4444403, 1111110);
insert into has_skill (ks_code, per_id) values (4444404, 1111110);
insert into has_skill (ks_code, per_id) values (4444405, 1111110);
insert into has_skill (ks_code, per_id) values (4444406, 1111110);
insert into has_skill (ks_code, per_id) values (4444407, 1111110);
insert into has_skill (ks_code, per_id) values (4444408, 1111110);
insert into has_skill (ks_code, per_id) values (4444409, 1111110);
insert into has_skill (ks_code, per_id) values (4444410, 1111110);
insert into has_skill (ks_code, per_id) values (4444411, 1111110);
insert into has_skill (ks_code, per_id) values (4444412, 1111110);
insert into has_skill (ks_code, per_id) values (4444413, 1111110);
insert into has_skill (ks_code, per_id) values (4444414, 1111110);
insert into has_skill (ks_code, per_id) values (4444415, 1111110);
insert into has_skill (ks_code, per_id) values (4444416, 1111110);
insert into has_skill (ks_code, per_id) values (4444417, 1111110);
insert into has_skill (ks_code, per_id) values (4444418, 1111110);
insert into has_skill (ks_code, per_id) values (4444419, 1111110);
insert into has_skill (ks_code, per_id) values (4444420, 1111110);

/* HAS_PREREQ INSERTS */
insert into has_prereq (c_code, prereq_code) values (1850, 1500);
insert into has_prereq (c_code, prereq_code) values (2200, 1850);
insert into has_prereq (c_code, prereq_code) values (2550, 2200);
insert into has_prereq (c_code, prereq_code) values (2900, 2550);
insert into has_prereq (c_code, prereq_code) values (3250, 2900);
insert into has_prereq (c_code, prereq_code) values (3600, 3250);
insert into has_prereq (c_code, prereq_code) values (3950, 3600);
insert into has_prereq (c_code, prereq_code) values (4300, 3950);
insert into has_prereq (c_code, prereq_code) values (4650, 4300);

/* HAS_CATEGORY INSERTS */
insert into has_category (cate_code, job_code) values ('15-1111', 2222201);
insert into has_category (cate_code, job_code) values ('15-1121', 2222202);
insert into has_category (cate_code, job_code) values ('15-1122', 2222203);
insert into has_category (cate_code, job_code) values ('15-1131', 2222204);
insert into has_category (cate_code, job_code) values ('15-1132', 2222205);
insert into has_category (cate_code, job_code) values ('15-1133', 2222206);
insert into has_category (cate_code, job_code) values ('15-1134', 2222207);
insert into has_category (cate_code, job_code) values ('15-1141', 2222208);
insert into has_category (cate_code, job_code) values ('15-1142', 2222209);
insert into has_category (cate_code, job_code) values ('15-1143', 2222210);

insert into has_category (cate_code, job_code) values ('15-1151', 2222201);
insert into has_category (cate_code, job_code) values ('15-1152', 2222202);
insert into has_category (cate_code, job_code) values ('15-1199', 2222203);
insert into has_category (cate_code, job_code) values ('15-1111', 2222204);
insert into has_category (cate_code, job_code) values ('15-1121', 2222205);
insert into has_category (cate_code, job_code) values ('15-1122', 2222206);
insert into has_category (cate_code, job_code) values ('15-1131', 2222207);
insert into has_category (cate_code, job_code) values ('15-1132', 2222208);
insert into has_category (cate_code, job_code) values ('15-1133', 2222209);
insert into has_category (cate_code, job_code) values ('15-1134', 2222210);

insert into has_category (cate_code, job_code) values ('15-1134', 2222211);

/* REQUIRED_CERT INSERTS */
insert into required_cert (job_code, cert_code) values (2222201, 5555506);
insert into required_cert (job_code, cert_code) values (2222202, 5555503);
insert into required_cert (job_code, cert_code) values (2222203, 5555508);
insert into required_cert (job_code, cert_code) values (2222203, 5555510);
insert into required_cert (job_code, cert_code) values (2222204, 5555504);
insert into required_cert (job_code, cert_code) values (2222205, 5555501);
insert into required_cert (job_code, cert_code) values (2222205, 5555506);
insert into required_cert (job_code, cert_code) values (2222205, 5555502);
insert into required_cert (job_code, cert_code) values (2222206, 5555503);
insert into required_cert (job_code, cert_code) values (2222206, 5555507);
insert into required_cert (job_code, cert_code) values (2222207, 5555506);
insert into required_cert (job_code, cert_code) values (2222207, 5555503);
insert into required_cert (job_code, cert_code) values (2222207, 5555504);
insert into required_cert (job_code, cert_code) values (2222207, 5555505);
insert into required_cert (job_code, cert_code) values (2222208, 5555507);
insert into required_cert (job_code, cert_code) values (2222209, 5555503);
insert into required_cert (job_code, cert_code) values (2222209, 5555501);
insert into required_cert (job_code, cert_code) values (2222210, 5555506);
insert into required_cert (job_code, cert_code) values (2222210, 5555507);
insert into required_cert (job_code, cert_code) values (2222210, 5555501);

/* ISSUED_BY INSERTS */
insert into issued_by (comp_id, cert_code) values (3333301, 5555501);
insert into issued_by (comp_id, cert_code) values (3333302, 5555502);
insert into issued_by (comp_id, cert_code) values (3333303, 5555503);
insert into issued_by (comp_id, cert_code) values (3333304, 5555504);
insert into issued_by (comp_id, cert_code) values (3333305, 5555505);
insert into issued_by (comp_id, cert_code) values (3333301, 5555506);
insert into issued_by (comp_id, cert_code) values (3333302, 5555507);
insert into issued_by (comp_id, cert_code) values (3333303, 5555508);
insert into issued_by (comp_id, cert_code) values (3333304, 5555509);
insert into issued_by (comp_id, cert_code) values (3333305, 5555510);

/* GRANTS_CERT INSERTS */
insert into grants_cert (c_code, cert_code) values (1500, 5555501);
insert into grants_cert (c_code, cert_code) values (1500, 5555502);
insert into grants_cert (c_code, cert_code) values (1500, 5555503);
insert into grants_cert (c_code, cert_code) values (1850, 5555502);
insert into grants_cert (c_code, cert_code) values (1850, 5555503);
insert into grants_cert (c_code, cert_code) values (2200, 5555504);
insert into grants_cert (c_code, cert_code) values (2900, 5555505);
insert into grants_cert (c_code, cert_code) values (2900, 5555506);
insert into grants_cert (c_code, cert_code) values (2900, 5555507);
insert into grants_cert (c_code, cert_code) values (2900, 5555508);
insert into grants_cert (c_code, cert_code) values (3600, 5555506);
insert into grants_cert (c_code, cert_code) values (3600, 5555507);
insert into grants_cert (c_code, cert_code) values (3600, 5555508);
insert into grants_cert (c_code, cert_code) values (3600, 5555509);
insert into grants_cert (c_code, cert_code) values (4650, 5555510);

/* HAS_PARENT INSERTS */


/* TEACHES_SKILL INSERTS */
insert into teaches_skill (ks_code, c_code) values (4444401, 1500);
insert into teaches_skill (ks_code, c_code) values (4444402, 1500);

insert into teaches_skill (ks_code, c_code) values (4444403, 1850);
insert into teaches_skill (ks_code, c_code) values (4444404, 1850);

insert into teaches_skill (ks_code, c_code) values (4444405, 2200);
insert into teaches_skill (ks_code, c_code) values (4444406, 2200);

insert into teaches_skill (ks_code, c_code) values (4444407, 2550);
insert into teaches_skill (ks_code, c_code) values (4444408, 2550);

insert into teaches_skill (ks_code, c_code) values (4444409, 2900);
insert into teaches_skill (ks_code, c_code) values (4444410, 2900);

insert into teaches_skill (ks_code, c_code) values (4444411, 3250);
insert into teaches_skill (ks_code, c_code) values (4444412, 3250);

insert into teaches_skill (ks_code, c_code) values (4444413, 3600);
insert into teaches_skill (ks_code, c_code) values (4444414, 3600);

insert into teaches_skill (ks_code, c_code) values (4444415, 3950);
insert into teaches_skill (ks_code, c_code) values (4444416, 3950);

insert into teaches_skill (ks_code, c_code) values (4444417, 4300);
insert into teaches_skill (ks_code, c_code) values (4444418, 4300);

insert into teaches_skill (ks_code, c_code) values (4444419, 4650);
insert into teaches_skill (ks_code, c_code) values (4444420, 4650);


/* SKILL_SET INSERTS */
insert into skill_set (ks_code, cate_code) values (4444401, '15-1111');
insert into skill_set (ks_code, cate_code) values (4444402, '15-1111');
insert into skill_set (ks_code, cate_code) values (4444407, '15-1111');
insert into skill_set (ks_code, cate_code) values (4444408, '15-1111');

insert into skill_set (ks_code, cate_code) values (4444403, '15-1121');
insert into skill_set (ks_code, cate_code) values (4444404, '15-1121');
insert into skill_set (ks_code, cate_code) values (4444409, '15-1121');
insert into skill_set (ks_code, cate_code) values (4444410, '15-1121');

insert into skill_set (ks_code, cate_code) values (4444405, '15-1122');
insert into skill_set (ks_code, cate_code) values (4444406, '15-1122');
insert into skill_set (ks_code, cate_code) values (4444411, '15-1122');
insert into skill_set (ks_code, cate_code) values (4444412, '15-1122');
insert into skill_set (ks_code, cate_code) values (4444401, '15-1122');
insert into skill_set (ks_code, cate_code) values (4444402, '15-1122');

insert into skill_set (ks_code, cate_code) values (4444407, '15-1131');
insert into skill_set (ks_code, cate_code) values (4444408, '15-1131');
insert into skill_set (ks_code, cate_code) values (4444413, '15-1131');
insert into skill_set (ks_code, cate_code) values (4444414, '15-1131');
insert into skill_set (ks_code, cate_code) values (4444403, '15-1131');
insert into skill_set (ks_code, cate_code) values (4444404, '15-1131');

insert into skill_set (ks_code, cate_code) values (4444409, '15-1132');
insert into skill_set (ks_code, cate_code) values (4444410, '15-1132');
insert into skill_set (ks_code, cate_code) values (4444415, '15-1132');
insert into skill_set (ks_code, cate_code) values (4444416, '15-1132');
insert into skill_set (ks_code, cate_code) values (4444405, '15-1132');
insert into skill_set (ks_code, cate_code) values (4444406, '15-1132');

insert into skill_set (ks_code, cate_code) values (4444411, '15-1133');
insert into skill_set (ks_code, cate_code) values (4444412, '15-1133');
insert into skill_set (ks_code, cate_code) values (4444417, '15-1133');
insert into skill_set (ks_code, cate_code) values (4444418, '15-1133');
insert into skill_set (ks_code, cate_code) values (4444401, '15-1133');
insert into skill_set (ks_code, cate_code) values (4444402, '15-1133');
insert into skill_set (ks_code, cate_code) values (4444407, '15-1133');
insert into skill_set (ks_code, cate_code) values (4444408, '15-1133');

insert into skill_set (ks_code, cate_code) values (4444413, '15-1134');
insert into skill_set (ks_code, cate_code) values (4444414, '15-1134');
insert into skill_set (ks_code, cate_code) values (4444419, '15-1134');
insert into skill_set (ks_code, cate_code) values (4444420, '15-1134');
insert into skill_set (ks_code, cate_code) values (4444403, '15-1134');
insert into skill_set (ks_code, cate_code) values (4444404, '15-1134');
insert into skill_set (ks_code, cate_code) values (4444409, '15-1134');
insert into skill_set (ks_code, cate_code) values (4444410, '15-1134');

insert into skill_set (ks_code, cate_code) values (4444415, '15-1141');
insert into skill_set (ks_code, cate_code) values (4444416, '15-1141');
insert into skill_set (ks_code, cate_code) values (4444405, '15-1141');
insert into skill_set (ks_code, cate_code) values (4444406, '15-1141');

insert into skill_set (ks_code, cate_code) values (4444417, '15-1142');
insert into skill_set (ks_code, cate_code) values (4444418, '15-1142');
insert into skill_set (ks_code, cate_code) values (4444407, '15-1142');
insert into skill_set (ks_code, cate_code) values (4444408, '15-1142');

insert into skill_set (ks_code, cate_code) values (4444419, '15-1143');
insert into skill_set (ks_code, cate_code) values (4444420, '15-1143');
insert into skill_set (ks_code, cate_code) values (4444409, '15-1143');
insert into skill_set (ks_code, cate_code) values (4444410, '15-1143');

insert into skill_set (ks_code, cate_code) values (4444401, '15-1151');
insert into skill_set (ks_code, cate_code) values (4444402, '15-1151');

insert into skill_set (ks_code, cate_code) values (4444403, '15-1152');
insert into skill_set (ks_code, cate_code) values (4444404, '15-1152');

insert into skill_set (ks_code, cate_code) values (4444405, '15-1199');
insert into skill_set (ks_code, cate_code) values (4444406, '15-1199');

/* REQUIRED_SKILL INSERTS */
insert into required_skill (job_code, ks_code) values (2222201, 4444401);
insert into required_skill (job_code, ks_code) values (2222201, 4444402);
insert into required_skill (job_code, ks_code) values (2222202, 4444403);
insert into required_skill (job_code, ks_code) values (2222202, 4444404);
insert into required_skill (job_code, ks_code) values (2222203, 4444405);
insert into required_skill (job_code, ks_code) values (2222203, 4444406);
insert into required_skill (job_code, ks_code) values (2222204, 4444407);
insert into required_skill (job_code, ks_code) values (2222204, 4444408);
insert into required_skill (job_code, ks_code) values (2222205, 4444409);
insert into required_skill (job_code, ks_code) values (2222205, 4444410);
insert into required_skill (job_code, ks_code) values (2222206, 4444411);
insert into required_skill (job_code, ks_code) values (2222206, 4444412);
insert into required_skill (job_code, ks_code) values (2222207, 4444413);
insert into required_skill (job_code, ks_code) values (2222207, 4444414);
insert into required_skill (job_code, ks_code) values (2222208, 4444415);
insert into required_skill (job_code, ks_code) values (2222208, 4444416);
insert into required_skill (job_code, ks_code) values (2222209, 4444417);
insert into required_skill (job_code, ks_code) values (2222209, 4444418);
insert into required_skill (job_code, ks_code) values (2222210, 4444419);
insert into required_skill (job_code, ks_code) values (2222210, 4444420);

insert into required_skill (job_code, ks_code) values (2222206, 4444401);
insert into required_skill (job_code, ks_code) values (2222206, 4444402);
insert into required_skill (job_code, ks_code) values (2222207, 4444403);
insert into required_skill (job_code, ks_code) values (2222207, 4444404);
insert into required_skill (job_code, ks_code) values (2222208, 4444405);
insert into required_skill (job_code, ks_code) values (2222208, 4444406);
insert into required_skill (job_code, ks_code) values (2222209, 4444407);
insert into required_skill (job_code, ks_code) values (2222209, 4444408);
insert into required_skill (job_code, ks_code) values (2222210, 4444409);
insert into required_skill (job_code, ks_code) values (2222210, 4444410);

/* PREFERRED_SKILL INSERTS */
insert into preferred_skill (job_code, ks_code) values (2222201, 4444408);
insert into preferred_skill (job_code, ks_code) values (2222201, 4444411);
insert into preferred_skill (job_code, ks_code) values (2222202, 4444418);
insert into preferred_skill (job_code, ks_code) values (2222202, 4444407);
insert into preferred_skill (job_code, ks_code) values (2222203, 4444407);
insert into preferred_skill (job_code, ks_code) values (2222203, 4444404);
insert into preferred_skill (job_code, ks_code) values (2222204, 4444403);
insert into preferred_skill (job_code, ks_code) values (2222204, 4444407);
insert into preferred_skill (job_code, ks_code) values (2222205, 4444408);
insert into preferred_skill (job_code, ks_code) values (2222205, 4444405);
insert into preferred_skill (job_code, ks_code) values (2222206, 4444413);
insert into preferred_skill (job_code, ks_code) values (2222206, 4444401);
insert into preferred_skill (job_code, ks_code) values (2222207, 4444404);
insert into preferred_skill (job_code, ks_code) values (2222207, 4444420);
insert into preferred_skill (job_code, ks_code) values (2222208, 4444410);
insert into preferred_skill (job_code, ks_code) values (2222208, 4444418);
insert into preferred_skill (job_code, ks_code) values (2222209, 4444406);
insert into preferred_skill (job_code, ks_code) values (2222209, 4444419);
insert into preferred_skill (job_code, ks_code) values (2222210, 4444416);
insert into preferred_skill (job_code, ks_code) values (2222210, 4444411);
insert into preferred_skill (job_code, ks_code) values (2222201, 4444416);
insert into preferred_skill (job_code, ks_code) values (2222201, 4444420);
insert into preferred_skill (job_code, ks_code) values (2222202, 4444406);
insert into preferred_skill (job_code, ks_code) values (2222202, 4444412);
insert into preferred_skill (job_code, ks_code) values (2222203, 4444407);
insert into preferred_skill (job_code, ks_code) values (2222203, 4444410);
insert into preferred_skill (job_code, ks_code) values (2222204, 4444403);
insert into preferred_skill (job_code, ks_code) values (2222204, 4444418);
insert into preferred_skill (job_code, ks_code) values (2222205, 4444415);
insert into preferred_skill (job_code, ks_code) values (2222205, 4444417);

/* COMPANY_NAICS */

insert into company_naics (comp_id, naics_code) values (3333301, 511210);
insert into company_naics (comp_id, naics_code) values (3333302, 518210);
insert into company_naics (comp_id, naics_code) values (3333303, 541511);
insert into company_naics (comp_id, naics_code) values (3333304, 541512);
insert into company_naics (comp_id, naics_code) values (3333305, 611420);