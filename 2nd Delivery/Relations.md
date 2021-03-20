<p>
Person(<ins>id</ins>, name, birth_date, death_date, age, gender, phone_number, NIF, email, address, insurance_id)<br>
Worker(<ins>person</ins>->Person, salary, work_schedule)<br>
Manager(<ins>person</ins>->Person, department->Department)<br>
Maintenance(<ins>person</ins>->Person, department->Department)<br>
Volunteer(<ins>person</ins>->Person, association_name, department->Department)<br>
Nurse(<ins>person</ins>->Person, department->Department)<br>
NurseService(<ins>nurse</ins>->Person, <ins>service</ins>->Service)<br>
Doctor(<ins>person</ins>->Person, specialization, department->Department)<br>
DoctorService(<ins>doctor</ins>->Person, <ins>service</ins>->Service)<br>
Deparment(<ins>id</ins>, floor)<br>
Client(<ins>person</ins>->Person)<br>
Patient(<ins>person</ins>->Person)<br>
Visitor(<ins>person</ins>->Person)<br>
VisitTime(<ins>patient</ins>->Person, <ins>visitor</ins>->person, start_visit_date, end_visit_date, order)<br>
Service(<ins>id</ins>, diagnosis, medication, location->Location)<br>
MedicalRecord(<ins>patient</ins>->Person, <ins>service</ins>->Service, price, date_in, date_out)<br>
Appointment(<ins>service</ins>Service)<br>
Surgery(<ins>service</ins>Service)<br>
Ambulance(<ins>service</ins>Service, amb_id, amb_num, priority)<br>
AmbulanceMaintenance(<ins>ambulance</ins>->Ambulance, <ins>maintenance</ins>->Maintenance, order)<br>
Location(<ins>id</ins>id, room_number, bed_number, department->Department)<br>
Extern(<ins>location</ins>->Location, address)<br>
SurgeryRoom(<ins>location</ins>->Location, specialization)<br>
IntensiveCareRoom(<ins>location</ins>->Location, o2, iv)<br>
NormalCareRoom(<ins>location</ins>->Location)<br>
Office(<ins>location</ins>->Location)<br>
</p>
