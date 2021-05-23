.mode	columns
.headers	on
.nullvalue	NULL

-- Get workers ordered by department

Drop View IF EXISTS WorkerDepartment;
Create View IF NOT EXISTS WorkerDepartment as
Select person, department, 'manager' as job from Manager
union 
Select person, department, 'maintenance' as job from Maintenance
union 
Select person, department, 'volunteer' as job from Volunteer
union 
Select person, department, 'nurse' as job from Nurse
union 
Select person, department, 'doctor' as job from Doctor;

-- Select * from WorkerDepartment;

Select name, department, floor, job
from (
Select person, department, floor, job
from WorkerDepartment WD
join Department D
on WD.department = D.id
) WDF
join Person P
on WDF.person = P.id;