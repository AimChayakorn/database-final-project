\copy "user" FROM '/init_files/user_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy LEARNER FROM '/init_files/learner_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy COURSE FROM '/init_files/course_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy REVIEW FROM '/init_files/review_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy MESSAGE FROM '/init_files/message_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy ADMIN FROM '/init_files/admin_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy TRANSACTION FROM '/init_files/transaction_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy ENROLLMENT FROM '/init_files/enrollment_mock_data.csv' DELIMITER ',' CSV HEADER;