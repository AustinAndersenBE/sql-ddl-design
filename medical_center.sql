DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE MedicalCenter(
    medical_center_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255)
);

CREATE TABLE Doctor (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    specialization VARCHAR(255),
    medical_center_id INT REFERENCES MedicalCenter(medical_center_id)
);

CREATE TABLE Patient (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE Visit (
    visit_id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES Doctor(doctor_id),
    patient_id INT REFERENCES Patient(patient_id),
    visit_date DATE
)

CREATE TABLE Disease (
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
)

CREATE TABLE Diagnosis (
    diagnosis_id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES Visit(visit_id),
    disease_id INT REFERENCES Disease(disease_id)
)

-- Insert data into MedicalCenter table
INSERT INTO MedicalCenter (name, location) VALUES
('Central Hospital', 'New York'),
('West Clinic', 'San Francisco'),
('East Medical Center', 'Boston');

-- Insert data into Doctor table
INSERT INTO Doctor (name, specialization, medical_center_id) VALUES
('Dr. Smith', 'Cardiology', 1),
('Dr. Johnson', 'Neurology', 2),
('Dr. Williams', 'Orthopedics', 3);

-- Insert data into Patient table
INSERT INTO Patient (name, date_of_birth) VALUES
('Alice', '1990-01-01'),
('Bob', '1985-12-12'),
('Charlie', '2000-07-07');

-- Insert data into Visit table
INSERT INTO Visit (doctor_id, patient_id, visit_date) VALUES
(1, 1, '2023-10-13'),
(2, 2, '2023-10-14'),
(3, 3, '2023-10-15'),
(1, 3, '2023-10-16');

-- Insert data into Disease table
INSERT INTO Disease (name) VALUES
('High Blood Pressure'),
('Migraine'),
('Arthritis');

-- Insert data into Diagnosis table
INSERT INTO Diagnosis (visit_id, disease_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1);
