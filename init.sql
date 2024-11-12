\copy REVIEW FROM '/init_files/review_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy MESSAGE FROM '/init_files/message_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy "user" FROM '/init_files/user_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy ADMIN FROM '/init_files/admin_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy "transaction" FROM '/init_files/transaction_mock_data.csv' DELIMITER ',' CSV HEADER;
\copy ENROLLMENT FROM '/init_files/enrollment_mock_data.csv' DELIMITER ',' CSV HEADER;