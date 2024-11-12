CREATE TABLE REVIEW (
    Review_id UUID PRIMARY KEY,
    Send_time TIMESTAMP NOT NULL,
    Review_message VARCHAR(1024) NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5) NOT NULL
);

CREATE TABLE MESSAGE (
    Message_id UUID PRIMARY KEY,
    Message VARCHAR(1024) NOT NULL,
    Send_time TIMESTAMP NOT NULL
);

CREATE TABLE "user" (
    Email VARCHAR(128) PRIMARY KEY,
    Bank_account VARCHAR(128) NOT NULL,
    Role VARCHAR(32),
    Birthdate DATE,
    Firstname VARCHAR(64) NOT NULL,
    Lastname VARCHAR(64) NOT NULL,
    Phone_number VARCHAR(10),
    Display_name VARCHAR(64),
    Password VARCHAR(128) NOT NULL,
    Contact_Info VARCHAR(256)
);

CREATE TABLE ADMIN (
    Email VARCHAR(128) PRIMARY KEY,
    FOREIGN KEY (Email) REFERENCES "user"(Email)
);

CREATE TABLE "transaction" (
    Transaction_id UUID PRIMARY KEY,
    Transaction_amount DECIMAL(10,2) CHECK (Transaction_amount > 0) NOT NULL,
    Actual_amount DECIMAL(10,2),
    Transaction_date TIMESTAMP NOT NULL,
    Status VARCHAR(32) CHECK (Status IN ('Pending', 'Completed', 'Failed')) NOT NULL
);

CREATE TABLE ENROLLMENT (
    Enrollment_id UUID PRIMARY KEY,
    Verify_date TIMESTAMP NOT NULL,
    Verify_status VARCHAR(32) CHECK (Verify_status IN ('Pending', 'Verified', 'Rejected')) NOT NULL,
    Image_url VARCHAR(256)
);

CREATE TABLE LEARNER (
    Email VARCHAR(128) PRIMARY KEY,
    Interest VARCHAR(256),
    FOREIGN KEY (Email) REFERENCES "user"(Email)
);

CREATE TABLE TUTOR (
    Email VARCHAR(128) PRIMARY KEY,
    Education VARCHAR(256),
    Specialization VARCHAR(256),
    FOREIGN KEY (Email) REFERENCES "user"(Email)
);

CREATE TABLE TAG (
    Tag_id UUID PRIMARY KEY,
    Count INT DEFAULT 0,
    Tag_name VARCHAR(64) NOT NULL
);

CREATE TABLE VIDEO (
    Video_id UUID PRIMARY KEY,
    Video_title VARCHAR(256) NOT NULL,
    Video_url VARCHAR(512) NOT NULL,
    Created_date TIMESTAMP NOT NULL
);

CREATE TABLE COURSE (
    Course_id UUID PRIMARY KEY,
    Price DECIMAL(10, 2) CHECK (Price > 0),
    Course_description VARCHAR(256),
    Subject VARCHAR(64) NOT NULL,
    Course_length INT CHECK (Course_length > 0),
    Created_date TIMESTAMP NOT NULL,
    Number_of_student INT CHECK (Number_of_student >= 0),
    Course_capacity INT CHECK (Course_capacity > 0) NOT NULL,
    Location VARCHAR(128),
    Session_status VARCHAR(32) CHECK (Session_status IN ('Scheduled', 'Ongoing', 'Closed')) NOT NULL,
    Is_publish BOOLEAN NOT NULL
);

CREATE TABLE VIDEO_COURSE (
    Course_id UUID PRIMARY KEY,
    FOREIGN KEY (Course_id) REFERENCES COURSE(Course_id)
);

CREATE TABLE LIVE_COURSE (
    Course_id UUID PRIMARY KEY,
    Start_time TIMESTAMP NOT NULL,
    End_time TIMESTAMP NOT NULL,
    Location VARCHAR(128) NOT NULL,
    FOREIGN KEY (Course_id) REFERENCES COURSE(Course_id)
);
