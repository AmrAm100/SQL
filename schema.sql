CREATE TABLE Users(
    "id" INTEGER,
    "first" TEXT NOT NULL,
    "last" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    primary key("id")
);

CREATE TABLE school_university(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    primary key("id")
);

CREATE TABLE Companies(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    primary key("id")
);

CREATE TABLE Connections_with_People(
    "id" INTEGER,
    "user1_id" TEXT,
    "user2_id" TEXT,
    primary key("id")
    foreign key("user1_id") references users(id),
    foreign key("user2_id") references users(id),
    CHECK ("user1_id" != "user2_id"),
    UNIQUE ("user1_id", "user2_id")
);

CREATE TABLE Connections_with_Schools(
    "id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC NOT NULL,
    "shcool_id" INTEGER,
    "user_id" INTEGER,
    "type" TEXT NOT NULL,
    primary key("id"),
    foreign key("shcool_id") references shcool(id),
    foreign key("user_id") references users(id)
);

CREATE TABLE Connections_with_Companies(
    "id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC NOT NULL,
    "Companie_id" INTEGER,
    "user_id" INTEGER,
    "title" TEXT NOT NULL,
    primary key("id"),
    foreign key("Companie_id") references Companie(id),
    foreign key("user_id") references users(id)
);
