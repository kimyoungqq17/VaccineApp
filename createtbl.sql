-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.


CREATE TABLE CATEGORY
(
    cname VARCHAR(30) NOT NULL,
    priority_number INTEGER NOT NULL,
    PRIMARY KEY(cname)
);


CREATE TABLE PERSON
(
    health_insurance_number INTEGER NOT NULL,
    pname VARCHAR(30) NOT NULL,
    pgender VARCHAR(10) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone_number INTEGER NOT NULL,
    register_date DATE NOT NULL,
    profession VARCHAR(50) NOT NULL,
    physical_proximity_priorityX VARCHAR(50) DEFAULT 'NO',
    immunologically_compromised  VARCHAR(50) DEFAULT 'NO',
    cname VARCHAR(30) NOT NULL,
    PRIMARY KEY (health_insurance_number),
    FOREIGN KEY(cname) REFERENCES category
);
CREATE TABLE LOCATION
(
    location_name VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    PRIMARY KEY(location_name)
);
CREATE TABLE DAYS
(
    adate DATE NOT NULL,
    nr_avaliable_slot INTEGER,
    nr_avaliable_vaccine INTEGER,
    nr_ppl_can_be_vaccinated INTEGER,
    location_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(adate, location_name),
    FOREIGN KEY(location_name) REFERENCES LOCATION
);
CREATE TABLE SLOT
(
    slot_id INTEGER NOT NULL,
    slot_time VARCHAR(10) NOT NULL,
    adate DATE NOT NULL,
    location_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(slot_id, slot_time, adate, location_name),
    FOREIGN KEY(adate, location_name) REFERENCES DAYS,
    FOREIGN KEY(location_name) REFERENCES LOCATION
);


CREATE TABLE PERSON_SLOT_ASSIGNMENT
(
    health_insurance_number INTEGER NOT NULL,
    person_slot_assigned_date DATE NOT NULL,
    slot_id INTEGER NOT NULL,
    slot_time VARCHAR(10) NOT NULL,
    adate DATE NOT NULL,
    location_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(slot_id, slot_time, adate, location_name),
    FOREIGN KEY(slot_id, slot_time, adate, location_name) REFERENCES SLOT,
    FOREIGN KEY(health_insurance_number) REFERENCES PERSON
);

CREATE TABLE HOSPITAL
(
    location_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(location_name),
    FOREIGN KEY(location_name) REFERENCES LOCATION
);

CREATE TABLE NURSE
(
    candian_nurse_license_number INTEGER NOT NULL,
    nName VARCHAR(20) NOT NULL,
    location_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(candian_nurse_license_number),
    FOREIGN KEY(location_name) REFERENCES HOSPITAL
);

CREATE TABLE ASSIGN_NURSE_DATE
(
    candian_nurse_license_number INTEGER NOT NULL,
    adate DATE NOT NULL,
    location_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(candian_nurse_license_number, adate, location_name),
    FOREIGN KEY(location_name) REFERENCES LOCATION,
    FOREIGN KEY (candian_nurse_license_number) REFERENCES NURSE,
    FOREIGN KEY (adate, location_name) REFERENCES DAYS

);
CREATE TABLE SLOT_ADMINISTER_BY_NURSE
(
    slot_id INTEGER NOT NULL,
    slot_time VARCHAR(10) NOT NULL,
    adate DATE NOT NULL,
    location_name VARCHAR(50) NOT NULL,
    canadian_nurse_license_number INTEGER NOT NULL,
    PRIMARY KEY(slot_id, slot_time, adate, location_name),
    FOREIGN KEY(slot_id, slot_time, adate, location_name) REFERENCES SLOT,
    FOREIGN KEY(adate, location_name) REFERENCES DAYS,
    FOREIGN KEY(location_name) REFERENCES LOCATION,
    FOREIGN KEY(canadian_nurse_license_number) REFERENCES NURSE
);

CREATE TABLE VACCINE
(
    vaccine_name VARCHAR(50) NOT NULL,
    nr_doses_required INTEGER NOT NULL,
    wait_period_in_days INTEGER NOT NULL,
    PRIMARY KEY(vaccine_name)
);

CREATE TABLE BATCH
(
    batch_nr INTEGER NOT NULL,
    manufacture_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    location_name VARCHAR(50) NOT NULL,
    vaccine_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(batch_nr, vaccine_name),
    FOREIGN KEY(location_name) REFERENCES LOCATION,
    FOREIGN KEY(vaccine_name) REFERENCES VACCINE

--     CONSTRAINT mandate_expdate CHECK(manufacture_date < expiry_date)
);

CREATE TABLE VIAL
(
    vial_nr INTEGER NOT NULL,

    slot_id INTEGER NOT NULL,
    slot_time VARCHAR(10) NOT NULL,
    adate DATE NOT NULL,
    location_name VARCHAR(50) NOT NULL,

    batch_nr INTEGER NOT NULL UNIQUE,
    vaccine_name VARCHAR(50) NOT NULL,

    PRIMARY KEY(vial_nr, batch_nr, vaccine_name),
    FOREIGN KEY(adate, location_name) REFERENCES DAYS,
    FOREIGN KEY(location_name) REFERENCES LOCATION,
    FOREIGN KEY(slot_id, slot_time, adate, location_name) REFERENCES SLOT,
    FOREIGN KEY(batch_nr, vaccine_name) REFERENCES BATCH,
    FOREIGN KEY(vaccine_name) REFERENCES VACCINE


);



























