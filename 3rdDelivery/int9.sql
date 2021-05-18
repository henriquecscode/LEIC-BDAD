.mode	columns
.headers	on
.nullvalue	NULL

-- Get all of the workers related with a given patient

-- Select price, location, patient, doctor, service
select patient, name as patientsName, doctor, doctorsName, service from (
    select patient, doctor, service, name as doctorsName
    from (
            (
                (Service NATURAL JOIN PATIENT) as SP
            JOIN DoctorService as DS
            ON SP.id = DS.service) as DSP
        JOIN Person as P
        ON P.id = DSP.doctor)) as DSPP 
JOIN (Select id, name from Person) as P
ON P.id = DSPP.patient;