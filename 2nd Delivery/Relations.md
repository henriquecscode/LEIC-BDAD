<p>
Person(<ins>id</ins>, name, birth_date, death_date, age, gender, phone_number, NIF, email, address, insurance_id)<br>
id -> name, birth_date, death_date, gender, phone_number, NIF, email, address, insurance_id
birth_date ->age

Department(<ins>id</ins>, floor)<br>
id->floor

Location(<ins>id</ins>id, room_number, bed_number, department->Department)<br>
id->room_number, bed_number, department

Service(<ins>id</ins>, diagnosis, medication, location->Location)<br>
id->diagnosis, medication, location

Worker(<ins>person</ins>->Person, salary, work_schedule)<br>
person-> salary, work_schedule

Manager(<ins>person</ins>->Person, department->Department)<br>
person->department

Maintenance(<ins>person</ins>->Person, department->Department)<br>
person->department

Volunteer(<ins>person</ins>->Person, association_name, department->Department)<br>
person->association_name, department

Nurse(<ins>person</ins>->Person, department->Department)<br>
person->department

NurseService(<ins>nurse</ins>->Person, <ins>service</ins>->Service)<br>

Doctor(<ins>person</ins>->Person, specialization, department->Department)<br>
person-> specialization, department

DoctorService(<ins>doctor</ins>->Person, <ins>service</ins>->Service)<br>

Client(<ins>person</ins>->Person)<br>

Patient(<ins>person</ins>->Person)<br>

Visitor(<ins>person</ins>->Person)<br>

VisitTime(<ins>patient</ins>->Person, <ins>visitor</ins>->person, start_visit_date, 
end_visit_date, order)<br>
patient, visitor -> start_visit_date, end_visit_date, order

MedicalRecord(<ins>patient</ins>->Person, <ins>service</ins>->Service, price, date_in, date_out)<br>
patient, service ->price, date_in, date_out

Appointment(<ins>service</ins>Service)<br>

Surgery(<ins>service</ins>Service)<br>

Ambulance(<ins>service</ins>Service, amb_id, amb_num, priority)<br>
service-> amb_id, amb_num, priority

AmbulanceMaintenance(<ins>ambulance</ins>->Ambulance, <ins>maintenance</ins>->Maintenance, order)<br>
ambulance, maintenance -> order

Extern(<ins>location</ins>->Location, address)<br>
location ->address

SurgeryRoom(<ins>location</ins>->Location, specialization)<br>
location-> specialization

IntensiveCareRoom(<ins>location</ins>->Location, o2, iv)<br>
location -> o2, iv

NormalCareRoom(<ins>location</ins>->Location)<br>

Office(<ins>location</ins>->Location)<br>

</p>
