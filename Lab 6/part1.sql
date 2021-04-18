CREATE USER lab6@'localhost' IDENTIFIED BY 'mypassword';

CREATE ROLE superuser;

GRANT ALL ON *.* TO superuser;

GRANT superuser TO lab6@'localhost';

CREATE USER lab6@'%' IDENTIFIED BY 'mypassword';

GRANT SELECT ON *.* TO lab6 @ '%';

DROP USER lab6@'localhost';
DROP USER lab6@'%';
DROP ROLE superuser;