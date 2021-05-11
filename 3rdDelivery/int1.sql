.mode	columns
.headers	on
.nullvalue	NULL
                
-- Get all workers from the hospital
SELECT P.id, P.name, P.birth_date, P.death_date, P.age, P.gender, P.phone_number, P.NIF, P.email, P.address, P.insurance_id
FROM Worker W
JOIN Person P
ON W.person = P.id