.mode	columns
.headers	on
.nullvalue	NULL

-- Get the ambulances available and their priority
-- ordered from top priority to lower priorrity

Select A.amb_id, A.priority
FROM Ambulance A
ORDER BY priority DESC