.mode	columns
.headers	on
.nullvalue	NULL

-- Get the managers and doctors associated with each other, but only for the doctors who have directed appointments
Select managerId, manager, doctorId, name as doctor, department
from (
    Select managerId, name as manager, doctorId, department
    from (
        Select M.person as managerId, D.person as doctorId, department
        from Manager as M
        JOIN
        (
            Select person, department
            from Doctor as D
            JOIN (
                Select doctor
                from DoctorService
                where service in (
                    Select id
                    from Appointment as A
                    JOIN
                    Service as S
                    on A.service = S.id
                )
            ) as DS
            ON D.person = DS.doctor
        ) as D
        using(department)
    ) as MD
    JOIN
    Person as P
    ON MD.managerID = P.id
) as MD
JOIN
Person as P
ON MD.doctorID = P.id;