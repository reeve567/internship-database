create table if not exists students
(
    id           integer primary key autoincrement,
    first        text not null,
    last         text not null,
    email        text not null,
    address      text not null,
    phoneNumber  text not null,
    internshipId integer,
    foreign key (internshipId) references internships (internshipApplicationId)
);

create table if not exists workedOnProject
(
    studentId integer not null,
    projectId integer not null,
    foreign key (studentId) references students (id),
    foreign key (projectId) references projects (id)
);

create table if not exists projects
(
    id          integer primary key autoincrement,
    projectName text not null,
    languages   text not null
);

create table if not exists internshipApplications
(
    id                   integer primary key autoincrement,
    internshipPositionId integer not null,
    studentId            integer not null,
    successful           integer not null,
    foreign key (studentId) references students (id),
    foreign key (internshipPositionId) references internshipPositions (id)
);

create table if not exists internships
(
    internshipApplicationId integer primary key not null,
    duties                  text                not null,
    wages                   real                not null,
    story                   text                not null,
    foreign key (internshipApplicationId) references internshipApplications (id)
);

create table if not exists internshipPositions
(
    id        integer primary key autoincrement,
    companyId integer not null,
    title     text    not null,
    foreign key (companyId) references companies (id)
);

create table if not exists companies
(
    id   integer primary key autoincrement,
    name text not null
);

create view if not exists studentInternship
as
select *
from students
         join (select *
               from internshipPositions
                        join internshipApplications
                             on internshipPositions.id = internshipApplications.internshipPositionId) as res
              on students.id = res.studentId;

create view if not exists applicationToInternship as select * from internships left join internshipApplications on internshipApplications.id = internships.internshipApplicationId;

create view if not exists companiesPositions as select * from companies join internshipPositions on companies.id = internshipPositions.companyId;

/*
create view if not exists internshipLowestWage
as
select (ip.id, ip.title, name, minWages)
from (internshipPositions as ip
    join companies as comp on ip.companyId = comp.id)
         join (select min(wages) as minWages
               from applicationToInternship
               where applicationToInternship.internshipPositionId = ip.id);*/
