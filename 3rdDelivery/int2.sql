.mode	columns
.headers	on
.nullvalue	NULL

-- Get the number of specializations of each doctor
Select P.name, S.noSpecializations
from Person P
JOIN (
Select doctor, count(specialization) as noSpecializations
from DoctorSpecialization
group by doctor) S
on P.id = S.doctor