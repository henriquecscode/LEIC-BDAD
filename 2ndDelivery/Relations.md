<p>
Person(<ins>id</ins>, name, birth_date, death_date, age, gender, phone_number, NIF, email, address, insurance_id)<br>
id -> name, birth_date, death_date, age, gender, phone_number, NIF, email, address, insurance_id

Department(<ins>id</ins>, floor)<br>
id -> floor

Location(<ins>id</ins>id, room_number, bed_number)<br>
id -> room_number, bed_number

Shift(<ins>id</ins>, day_of_the_week_in, time_in, day_of_the_week_out, time_out)<br>
id -> day_of_the_week_in, time_in, day_of_the_week_out, time_out

Service(<ins>id</ins>, diagnosis, medication, price, date_in, date_out, location -> Location patient->Patient)<br>
id -> diagnosis, medication, price, date_in, date_out, location, patient

Specialization(<ins>speciality</ins>)<br>
speciality -> speciality

Worker(<ins>person</ins>->Person)<br>
person -> person

WorkerShift(<ins>worker</ins>->Worker, <ins>shift</ins>->Shift)
worker, shift -> worker, shift

Manager(<ins>person</ins>->Worker, salary, department->Department)<br>
person -> department

Maintenance(<ins>person</ins>->Worker, salary, department->Department)<br>
person -> department

Volunteer(<ins>person</ins>->Worker, association_name, department->Department)<br>
person -> association_name, department

Nurse(<ins>person</ins>->Worker, salary, department->Department)<br>
person -> salary, department

NurseService(<ins>nurse</ins>->Nurse, <ins>service</ins>->Service)<br>
nurse, service -> nurse, service

Doctor(<ins>person</ins>->Worker, salary, department->Department)<br>
person-> salary, department

DoctorService(<ins>doctor</ins>->Doctor, <ins>service</ins>->Service)<br>
doctor, service -> doctor, service

DoctorSpecialization(<ins>doctor</ins>->Doctor, <ins>specialization</ins>->Specialization)<br>
doctor, specialization -> doctor, specialization

Client(<ins>person</ins>->Person)<br>
person -> person

Patient(<ins>person</ins>->Client)<br>
person -> person

Visitor(<ins>person</ins>->?Client)<br>
person -> person

VisitTime(<ins>patient</ins>->Patient, <ins>visitor</ins>->Visitor, start_visit_date, 
end_visit_date, order)<br>
patient, visitor -> start_visit_date, end_visit_date, order

Appointment(<ins>service</ins>->Service)<br>
service -> service

Surgery(<ins>service</ins>->Service)<br>
service -> service

Ambulance(<ins>service</ins>->Service, amb_id, priority)<br>
service -> amb_id, priority

MaintenanceJob(<ins>ambulance</ins>->Ambulance, <ins>maintenance</ins>->Maintenance, date, did_disinfection, did_restock)<br>
ambulance, maintenance -> date, did_disinfection, did_restock

Extern(<ins>location</ins>->Location, address)<br>
location -> address

SurgeryRoom(<ins>location</ins>->Location)<br>
location -> location

SurgeryRoomSpecialization(<ins>room</ins>->SurgeryRoom, <ins>specialization</ins>->Specialization)<br>
room, specializatoin -> room, specialization

IntensiveCareRoom(<ins>location</ins>->Location, o2, iv)<br>
location -> o2, iv

NormalCareRoom(<ins>location</ins>->Location)<br>
location -> location

Office(<ins>location</ins>->Location)<br>
location -> location

</p>

<p>
Functional dependencies<br>
Para as relações Specialization, Worker, WorkerShift, NurseService, DoctorService, Client, Patient, Visitor, Appointment, Surgery, SurgeryRoom, SurgeryRoomSpecialization, NormalCareRoom e Office as dependências funcionais estão na BCNF, uma vez que se tratam de dependências funcionais triviais.<br>
Para as restantes relações, exceto a relação Person, uma vez que o lado esquerdo da relação funcional é também a sua chave, é possível concluir que se encontra na forma BCNF.<br>
</p>
