.headers on
.mode columns
PRAGMA foreign_keys=on;

DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Worker;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS Maintenance;
DROP TABLE IF EXISTS Volunteer;
DROP TABLE IF EXISTS Nurse;
DROP TABLE IF EXISTS NurseService;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS DoctorService;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Visitor;
DROP TABLE IF EXISTS VisitTime;
DROP TABLE IF EXISTS MedicalRecord;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Surgery;
DROP TABLE IF EXISTS Ambulance;
DROP TABLE IF EXISTS AmbulanceMaintenance;
DROP TABLE IF EXISTS Extern;
DROP TABLE IF EXISTS SurgeryRoom;
DROP TABLE IF EXISTS IntensiveCareRoom;
DROP TABLE IF EXISTS NormalCareRoom;
DROP TABLE IF EXISTS Office;



CREATE TABLE Person(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    birth_date DATE,
    death_date DATE,
    age INTEGER CHECK(age > 0),
    gender TEXT CHECK(gerder == 'M' || gender == 'F'),
    phone_number INTEGER,
    NIF INTEGER,
    email INTEGER,
    address INTEGER,
    insurance_id INTEGER,

    CONSTRAINT validAge CHECK(date('now') - birth_date == age || birth_date IS NULL || death_date IS NOT NULL)
    //Might need to change as this might not be a viable difference
);

CREATE TABLE Department(
    id INTEGER PRIMARY KEY,
    floor INTEGER
);

CREATE TABLE Location(
    id INTEGER PRIMARY KEY,
    room_number INTEGER CHECK(room_number > 0),
    bed_number INTEGER CHECK(bed_number > 0),
    department INTEGER REFERENCES Department
);

CREATE TABLE Service(
    id INTEGER PRIMARY KEY,
    diagnosis TEXT,
    medication TEXT,
    
);

CREATE TABLE Worker(
    person PRIMARY KEY REFERENCES Person,
    salary INTERGER CHECK (salary >= 0),
    //need to rework how work_schedule works
);

CREATE TABLE Manager(
    person PRIMARY KEY REFERENCES Person,
    department INTEGER REFERENCES Department NOT NULL
);

CREATE TABLE Maintenance(
    person PRIMARY KEY REFERENCES Person,
    department INTEGER REFERENCES Department NOT NULL
);

CREATE TABLE Volunteer(
    person PRIMARY KEY REFERENCES Person,
    association_name TEXT,
    department INTEGER REFERENCES Department NOT NULL
);

CREATE TABLE Nurse(
    person PRIMARY KEY REFERENCES Person,
    department INTEGER REFERENCES Department NOT NULL
);

CREATE TABLE NurseService(
    nurse REFERENCES Person
    service REFERNCES Service
    PRIMARY KEY(nurse, service)
);

CREATE TABLE Doctor(
    person PRIMARY KEY REFERENCES Person,
    specialization TEXT,
    department INTEGER REFERENCES Department NOT NULL
    CONSTRAINT PossibleSpecializations CHECK(
        specialization == 'None'
        || specialization == 'General'
    )
);

CREATE TABLE DoctorService(
    doctor REFERENCES Person
    service REFERNCES Service
    PRIMARY KEY(doctor, service)
);

CREATE TABLE Client(
    person INTEGER PRIMARY KEY REFERENCES Person
);

CREATE TABLE Patient(
    person INTEGER PRIMARY KEY REFERENCES Person
);

CREATE TABLE Visitor(
    person INTEGER PRIMARY KEY REFERENCES Person
);

CREATE TABLE VisitTime(
    patient REFERENCES Person,
    visitor REFERENCES Person,
    start_visit_date DATETIME,
    end_visit_date DATETIME,
    order INTEGER CHECK (order < 4), 
    PRIMARY KEY (patient, visitor),
    CONSTRAINT notSamePerson CHECK(patient != visitor)
    CONSTRAINT validVisitTime CHECK(end_visit_date > start_visit_date)
);
CREATE TABLE MedicalRecord(
    patient INTEGER REFERENCES Person,
    service INTEGER REFERENCES Service,
    price INTEGER CHECK(price > 0),
    date_in DATETIME,
    date_out DATETIME,
    PRIMARY KEY (patient, service),
    CONSTRAINT validServiceTime CHECK(date_out > date_in || date_out IS NULL)
);

CREATE TABLE Appointment(
    service INTEGER PRIMARY KEY REFERENCES Service
);

CREATE TABLE Surgery(
    service INTEGER PRIMARY KEY REFERENCES Service
);

CREATE TABLE Ambulance(
    service INTEGER PRIMARY KEY REFERENCES Service
    amb_id INTEGER CHECK(id > 0),
    amb_num INTEGER CHECK(amb_num > 0),
    priority INTEGER CHECK(priority >=1 && priority <= 5)
);

CREATE TABLE AmbulanceMaintenace(
    ambulance INTEGER REFERENCES Ambulance,
    maintenance INTEGER REFERENCES Maintenance,
    order INTEGER CHECK(order >= 1 && order <= 3),
    PRIMARY KEY(ambulance, maintenance)
);

CREATE TABLE Extern(
    location INTEGER PRIMARY KEY REFERENCES Location
    address TEXT
);

CREATE TABLE SurgeryRoom(
    location INTEGER PRIMARY KEY REFERENCES Location
    specialization TEXT,
    CONSTRAINT PossibleSpecializations CHECK(
        specialization == 'None'
        || specialization == 'General'
    )
);

CREATE TABLE IntensiveCareRoom(
    location INTEGER PRIMARY KEY REFERENCES Location
    o2 INTEGER,
    iv INTEGER
);

CREATE TABLE NormalCareRoom(
    location INTEGER PRIMARY KEY REFERENCES Location
);


CREATE TABLE Office(
    location INTEGER PRIMARY KEY REFERENCES Location
);



CREATE ASSERTION Max3VisitorPerPatient CHECK(
    //to be defined
);

CREATE ASSERTION DisjointLocations CHECK(

);

CREATE ASSERTION DisjoinWorkers CHECK(

);