DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Profile;
DROP TABLE IF EXISTS Dept;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS MultipleAssociations;
DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
    id INT NOT NULL,
    firstName VARCHAR(191) NOT NULL,
    age INT NOT NULL,
    lastName VARCHAR(191) NOT NULL,
    nicNo VARCHAR(191) NOT NULL,
    PRIMARY KEY(id,firstName)
);

CREATE TABLE MultipleAssociations (
    id INT NOT NULL,
    name VARCHAR(191) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Customer (
    id INT NOT NULL,
    name VARCHAR(191) NOT NULL,
    age INT NOT NULL,
    multipleassociationsId INT NOT NULL,
    CONSTRAINT FK_CUSTOMER_MULTIPLEASSOCIATIONS_0 FOREIGN KEY(multipleassociationsId) REFERENCES MultipleAssociations(id),
    PRIMARY KEY(id)
);

CREATE TABLE Dept (
    id INT NOT NULL,
    name VARCHAR(191) NOT NULL,
    multipleassociationsId INT NOT NULL,
    CONSTRAINT FK_DEPT_MULTIPLEASSOCIATIONS_0 FOREIGN KEY(multipleassociationsId) REFERENCES MultipleAssociations(id),
    PRIMARY KEY(id)
);

CREATE TABLE Profile (
    id INT NOT NULL,
    name VARCHAR(191) NOT NULL,
    isAdult BOOLEAN NOT NULL,
    salary FLOAT NOT NULL,
    age DECIMAL NOT NULL,
    isRegistered BINARY NOT NULL,
    userId INT NOT NULL,
    CONSTRAINT FK_PROFILE_USER_0 FOREIGN KEY(userId) REFERENCES User(id),
    PRIMARY KEY(id)
);

CREATE TABLE User (
    id INT NOT NULL,
    name VARCHAR(191) NOT NULL,
    multipleassociationsId INT NOT NULL,
    CONSTRAINT FK_USER_MULTIPLEASSOCIATIONS_0 FOREIGN KEY(multipleassociationsId) REFERENCES MultipleAssociations(id),
    PRIMARY KEY(id)
);
