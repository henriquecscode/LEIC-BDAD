.mode	columns
.headers	on
.nullvalue	NULL

-- Get the list of services, ordered by descending price
-- and with the patient who used the service

Select S.id, S.price, S.patient, P.name
FROM Service S
JOIN 
Person
ON (Person.id = S.patient)
ORDER BY price DESC 

