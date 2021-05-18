.mode	columns
.headers	on
.nullvalue	NULL

-- Get every nurse that has participated in every service

-- For testing purposes:
INSERT INTO NurseService Values(3, 1);
INSERT INTO NurseService Values(3, 4);

select P.id as nurse, name, birth_date, department, salary, noServices
from Person as P
Natural JOIN (
    select N.person as id, N.department, N.salary, noServices
    from Nurse as N
    JOIN (
        select distinct nurse, count(nurse) as noServices
        from NurseService
        group by nurse
        having count(nurse) = (select count(*) from Service)
        ) as NS
    )as N;


-- Revert testing conditions 
DELETE FROM NurseService WHERE nurse=3 AND service = 1;
DELETE FROM NurseService WHERE nurse=3 AND service = 4;