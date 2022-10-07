CREATE SCHEMA trains;

CREATE TABLE "Station"(
    "id" INTEGER NOT NULL,
    "Name" INTEGER NOT NULL,
    "Lie in" INTEGER NOT NULL
);
ALTER TABLE
    "Station" ADD PRIMARY KEY("id");
CREATE TABLE "City"(
    "id" INTEGER NOT NULL,
    "Region" VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "City" ADD PRIMARY KEY("id");
CREATE TABLE "Train"(
    "TrainNr" INTEGER NOT NULL,
    "Length" INTEGER NOT NULL,
    "Start" INTEGER NOT NULL,
    "End" INTEGER NOT NULL
);
ALTER TABLE
    "Train" ADD PRIMARY KEY("TrainNr");
CREATE TABLE "Connected"(
    "id" INTEGER NOT NULL,
    "Departure" DATE NOT NULL,
    "Arrival" DATE NOT NULL,
    "From" INTEGER NOT NULL,
    "To" INTEGER NOT NULL,
    "Train" INTEGER NOT NULL
);
ALTER TABLE
    "Connected" ADD PRIMARY KEY("id");
ALTER TABLE
    "Train" ADD CONSTRAINT "train_start_foreign" FOREIGN KEY("Start") REFERENCES "Station"("id");
ALTER TABLE
    "Train" ADD CONSTRAINT "train_end_foreign" FOREIGN KEY("End") REFERENCES "Station"("id");
ALTER TABLE
    "Station" ADD CONSTRAINT "station_lie in_foreign" FOREIGN KEY("Lie in") REFERENCES "City"("id");
ALTER TABLE
    "Connected" ADD CONSTRAINT "connected_from_foreign" FOREIGN KEY("From") REFERENCES "Station"("id");
ALTER TABLE
    "Connected" ADD CONSTRAINT "connected_to_foreign" FOREIGN KEY("To") REFERENCES "Station"("id");
ALTER TABLE
    "Connected" ADD CONSTRAINT "connected_train_foreign" FOREIGN KEY("Train") REFERENCES "Train"("TrainNr");