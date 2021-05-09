.mode	columns
.headers	on
.nullvalue	NULL

-- Get all patients that have had more than 1 visitor

Select name, noVisits
from (
    Select patient, count(visitor) as noVisits
    from VisitTime
    group by patient
    having count(visitor) > 1
    ) PV
join Person P
on PV.patient = P.id

