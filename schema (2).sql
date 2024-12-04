CREATE TABLE Users(
    `id` INT AUTO_INCREMENT,
    `first` VARCHAR(16) NOT NULL,
    `last` VARCHAR(16) NOT NULL,
    `user_name` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(32) NOT NULL,
    primary key(`id`)
);

CREATE TABLE school_university(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` MEDIUMTEXT NOT NULL,
    `year` INT NOT NULL,
    primary key(`id`)
);

CREATE TABLE Companies(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` MEDIUMTEXT NOT NULL,
    primary key(`id`)
);

CREATE TABLE Connections_with_People (
    `id` INT AUTO_INCREMENT,
    `user1_id` INT NOT NULL,
    `user2_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user1_id`) REFERENCES Users(`id`),
    FOREIGN KEY (`user2_id`) REFERENCES Users(`id`),
    CHECK (`user1_id` != `user2_id`),
    UNIQUE (`user1_id`, `user2_id`)
);

CREATE TABLE Connections_with_Schools(
    `id` INT AUTO_INCREMENT,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME NOT NULL,
    `shcool_id` INT,
    `user_id` INT,
    `type` ENUM('BA', 'MA', 'PhD') NOT NULL,
    primary key(`id`),
    foreign key(`shcool_id`) references school_university(`id`),
    foreign key(`user_id`) references Users(`id`)
);

CREATE TABLE Connections_with_Companies (
    `id` INT AUTO_INCREMENT,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME NOT NULL,
    `Companie_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `title` TEXT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`Companie_id`) REFERENCES Companies(`id`),
    FOREIGN KEY (`user_id`) REFERENCES Users(`id`)
);


CREATE INDEX idx_user_name ON Users(user_name);
CREATE INDEX idx_user1_id ON Connections_with_People(user1_id);
CREATE INDEX idx_user2_id ON Connections_with_People(user2_id);
CREATE INDEX idx_school_id ON Connections_with_Schools(id);
CREATE INDEX idx_company_id ON Connections_with_Companies(id);
