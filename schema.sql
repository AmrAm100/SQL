CREATE TABLE if not exists Passengers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
     PRIMARY KEY("id")
);

CREATE TABLE if not exists Airlines (
    "id" INTEGER,
    "name" TEXT ,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A','B','C','D','E','F')),
    PRIMARY KEY("id")

);

CREATE TABLE if not exists Flights (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "The_code_of_the_airport" INTEGER,
    "code_of_the_airport_departing_from" INTEGER NOT NULL,
    "code_of_the_airport_heading_to" INTEGER NOT NULL,
    "arrival_date" NUMERIC,
    FOREIGN KEY("airline_id") REFERENCES "Airlines"("id")
);

CREATE TABLE  if not exists Check_Ins (
    "id" INTEGER,
    "Passenger_id" INTEGER,
    "Flight_id" INTEGER,
    "date" NUMERIC ,
    "flight" TEXT,
    FOREIGN KEY("Passenger_id") REFERENCES "Passengers"("id"),
    FOREIGN KEY("Flight_id") REFERENCES "Flights"("id")

);
