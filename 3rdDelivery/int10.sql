.mode	columns
.headers	on
.nullvalue	NULL

-- What is the salary to be paid to all workers that have participated in some service
Select sum(salary)
from (
    Select person, salary
    from Doctor
    where person in (
        Select distinct person
        from DoctorService as DS
        JOIN Doctor as D
        on DS.doctor = D.person
    )
    UNION
    Select person, salary
    from Maintenance
    where person in (
        Select distinct person
        from MaintenanceJob as MJ
        JOIN Maintenance as M
        on MJ.maintenance = M.person
    )
    UNION
    Select person, salary
    from Nurse
    where person in (
        Select distinct person
        from NurseService as NS
        JOIN Nurse as N
        on NS.nurse = N.person
    )
);