-- companies

insert into companies (name)
values ('Arthrex');

insert into companies (name)
values ('ZoomTan');

insert into companies (name)
values ('Apple');

insert into companies (name)
values ('Google');

-- students

insert into students (first, last, email, address, phoneNumber, internshipId)
values ('Reeve', 'Blake', 'reeveblake@gmail.com', '6564 Chestnut Circle', '1209', null);

insert into students (first, last, email, address, phoneNumber, internshipId)
values ('Joe', 'Billy', 'joe@gmail.com', '123 Circle', '1209', null);

insert into students (first, last, email, address, phoneNumber, internshipId)
values ('Joey', 'John', 'joey@gmail.com', '61 Circle', '1239', null);

insert into students (first, last, email, address, phoneNumber, internshipId)
values ('Bob', 'Billy', 'bob@gmail.com', '123 Circle', '1309', null);

insert into students (first, last, email, address, phoneNumber, internshipId)
values ('Smith', 'Bloke', 'smith@gmail.com', '992 Circle', '190', null);

-- internship positions

insert into internshipPositions (companyId, title)
values (1, 'QA intern');

insert into internshipPositions (companyId, title)
values (2, 'Arduino intern');

insert into internshipPositions (companyId, title)
values (3, 'Idea stealer intern');

insert into internshipPositions (companyId, title)
values (4, 'Web developer intern');

insert into internshipPositions (companyId, title)
values (5, 'Google cloud intern');

-- internship applications

insert into internshipApplications (internshipPositionId, studentId, successful)
values (1, 1, false);

insert into internshipApplications (internshipPositionId, studentId, successful)
values (2, 2, true);

insert into internshipApplications (internshipPositionId, studentId, successful)
values (2, 2, true);


-- internship instances

insert into internships (internshipApplicationId, duties, wages, story)
values (2, 'do stuff', 15000, 'I won a pie eating contest');

