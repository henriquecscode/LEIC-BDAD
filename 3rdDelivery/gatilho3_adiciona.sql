.mode	columns
.headers	on
.nullvalue	NULL
PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS EnsureDoctorsSpecialization
BEFORE
INSERT ON DoctorService
WHEN
    not exists(
        Select specialization
        from DoctorSpecialization
        NATURAL JOIN
        (
            Select specialization
            from (
            Select location
            from Service
            where id = New.service 
            )
            JOIN
            SurgeryRoom
            using(location)
        )
        where doctor = New.doctor
    )
BEGIN
    Select raise(abort, "Doctor must have the right specialization for this surgery room");
END;