CREATE TABLE "user" (
    email VARCHAR(128) PRIMARY KEY,
    bank_account VARCHAR(128) NOT NULL,
    role VARCHAR(32) NOT NULL,
    birthdate TIMESTAMP,
    firstname VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    display_name VARCHAR(64) NOT NULL,
    password VARCHAR(128) NOT NULL,
    contact_info VARCHAR(256)
);

CREATE TABLE Learner (
    l_email VARCHAR(256) PRIMARY KEY REFERENCES "user"(email),
    learning_style VARCHAR(128) NOT NULL
);

CREATE TABLE Learner_Interest (
    l_email VARCHAR(256) REFERENCES Learner(l_email),
    interest VARCHAR(128) NOT NULL,
    PRIMARY KEY (l_email, interest)
);

CREATE TABLE Admin (
    a_email VARCHAR(256) PRIMARY KEY REFERENCES "user"(email),
    phone_number VARCHAR(10) NOT NULL
);

CREATE TABLE Tutor (
    t_email VARCHAR(256) PRIMARY KEY REFERENCES "user"(email),
    teaching_style VARCHAR(128) NOT NULL
);

CREATE TABLE Tutor_Education (
    t_email VARCHAR(256) REFERENCES Tutor(t_email),
    education VARCHAR(128) NOT NULL,
    PRIMARY KEY (t_email, education)
);

CREATE TABLE Tutor_Specialization (
    t_email VARCHAR(256) REFERENCES Tutor(t_email),
    specialization VARCHAR(128) NOT NULL,
    PRIMARY KEY (t_email, specialization)
);

CREATE TABLE Course (
    course_id UUID PRIMARY KEY,
    price DECIMAL(10, 2) NOT NULL,
    course_description VARCHAR(1024),
    subject VARCHAR(128),
    course_length DECIMAL(5, 2) NOT NULL,
    created_date TIMESTAMP NOT NULL,
    course_capacity INT NOT NULL,
    session_status VARCHAR(32) CHECK (session_status IN ('Scheduled', 'Ongoing', 'Closed', 'TutorConfirmed')) NOT NULL,
    is_publish BOOLEAN NOT NULL,
    course_type VARCHAR(16) CHECK (course_type IN ('Live', 'Video')) NOT NULL,
    l_email VARCHAR(256) REFERENCES Learner(l_email)
);

CREATE TABLE Have_Tag (
    course_id UUID REFERENCES Course(course_id),
    tag_name VARCHAR(32) CHECK (tag_name IN ('Math', 'Science', 'Language', 'Social', 'Music & Arts')) NOT NULL,
    PRIMARY KEY (course_id, tag_name)
);

CREATE TABLE Tag (
    tag_name VARCHAR(32) PRIMARY KEY CHECK (tag_name IN ('Math', 'Science', 'Language', 'Social', 'Music & Arts')),
    count INT NOT NULL
);

CREATE TABLE Live_Course (
    course_id UUID PRIMARY KEY REFERENCES Course(course_id),
    location VARCHAR(256) NOT NULL,
    start_time TIMESTAMP NOT NULL
);

CREATE TABLE Video_Course (
    course_id UUID PRIMARY KEY REFERENCES Course(course_id)
);

CREATE TABLE Video (
    video_id UUID PRIMARY KEY,
    created_date TIMESTAMP NOT NULL,
    video_title VARCHAR(128) NOT NULL,
    video_url VARCHAR(1024) NOT NULL
);

CREATE TABLE Have_Video (
    video_id UUID REFERENCES Video(video_id),
    course_id UUID REFERENCES Course(course_id),
    PRIMARY KEY (video_id, course_id)
);

CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    send_time TIMESTAMP NOT NULL,
    review_message VARCHAR(1024) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5) NOT NULL,
    course_id UUID REFERENCES Course(course_id),
    l_email VARCHAR(256) REFERENCES Learner(l_email)
);

CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    send_time TIMESTAMP NOT NULL,
    message VARCHAR(1024) NOT NULL,
    sender_email VARCHAR(256) REFERENCES "user"(email),
    receiver_email VARCHAR(256) REFERENCES "user"(email)
);

CREATE TABLE Refund_Student (
    transaction_id UUID PRIMARY KEY,
    refund_status VARCHAR(16) CHECK (refund_status IN ('Complete', 'Ongoing', 'Fail')) NOT NULL,
    a_email VARCHAR(256) REFERENCES Admin(a_email),
    l_email VARCHAR(256) REFERENCES Learner(l_email)
);

CREATE TABLE Transaction (
    transaction_id UUID PRIMARY KEY,
    transaction_date TIMESTAMP NOT NULL,
    transaction_amount DECIMAL(10, 2) NOT NULL,
    actual_amount DECIMAL(10, 2) NOT NULL,
    transaction_status VARCHAR(16) CHECK (transaction_status IN ('Complete', 'Fail', 'Ongoing')) NOT NULL
);

CREATE TABLE Pay_Tutor (
    transaction_id UUID REFERENCES Transaction(transaction_id),
    course_id UUID REFERENCES Course(course_id),
    a_email VARCHAR(256) REFERENCES Admin(a_email),
    t_email VARCHAR(256) REFERENCES Tutor(t_email),
    PRIMARY KEY (transaction_id, course_id)
);

CREATE TABLE Enroll (
    enrollment_id UUID PRIMARY KEY,
    transaction_id UUID REFERENCES Transaction(transaction_id),
    course_id UUID REFERENCES Course(course_id),
    l_email VARCHAR(256) REFERENCES Learner(l_email)
);

CREATE TABLE Enrollment (
    enrollment_id UUID PRIMARY KEY,
    verify_date TIMESTAMP NOT NULL,
    verify_status VARCHAR(16) CHECK (verify_status IN ('Complete', 'Ongoing', 'Fail')) NOT NULL,
    image_url VARCHAR(1024) NOT NULL,
    a_email VARCHAR(256) REFERENCES Admin(a_email)
);
