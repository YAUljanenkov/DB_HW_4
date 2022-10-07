CREATE SCHEMA hospital;

CREATE TABLE "Caregiver"(
    "id" INTEGER NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Qualification" VARCHAR(255) NOT NULL,
    "Station" INTEGER NOT NULL
);
ALTER TABLE
    "Caregiver" ADD PRIMARY KEY("id");
CREATE TABLE "Station"(
    "id" INTEGER NOT NULL,
    "Name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Station" ADD PRIMARY KEY("id");
CREATE TABLE "Doctor"(
    "id" INTEGER NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Area" VARCHAR(255) NOT NULL,
    "Rank" VARCHAR(255) NOT NULL,
    "Station" INTEGER NOT NULL
);
ALTER TABLE
    "Doctor" ADD PRIMARY KEY("id");
CREATE TABLE "Room"(
    "id" INTEGER NOT NULL,
    "Beds" INTEGER NOT NULL,
    "Station" INTEGER NOT NULL
);
ALTER TABLE
    "Room" ADD PRIMARY KEY("id");
CREATE TABLE "Patient"(
    "id" INTEGER NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Disease" VARCHAR(255) NOT NULL,
    "Doctor" INTEGER NOT NULL
);
ALTER TABLE
    "Patient" ADD PRIMARY KEY("id");
CREATE TABLE "Admission"(
    "id" INTEGER NOT NULL,
    "from" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "to" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "Room" INTEGER NOT NULL,
    "Patient" INTEGER NOT NULL
);
ALTER TABLE
    "Admission" ADD PRIMARY KEY("id");
ALTER TABLE
    "Room" ADD CONSTRAINT "room_station_foreign" FOREIGN KEY("Station") REFERENCES "Station"("id");
ALTER TABLE
    "Doctor" ADD CONSTRAINT "doctor_station_foreign" FOREIGN KEY("Station") REFERENCES "Station"("id");
ALTER TABLE
    "Caregiver" ADD CONSTRAINT "caregiver_station_foreign" FOREIGN KEY("Station") REFERENCES "Station"("id");
ALTER TABLE
    "Patient" ADD CONSTRAINT "patient_doctor_foreign" FOREIGN KEY("Doctor") REFERENCES "Doctor"("id");
ALTER TABLE
    "Admission" ADD CONSTRAINT "admission_room_foreign" FOREIGN KEY("Room") REFERENCES "Room"("id");
ALTER TABLE
    "Admission" ADD CONSTRAINT "admission_patient_foreign" FOREIGN KEY("Patient") REFERENCES "Patient"("id");