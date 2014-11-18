CREATE USER 'meerkat'@'localhost' IDENTIFIED BY 'm33rk4t';

GRANT INSERT, SELECT, UPDATE on meerkat_db.* to 'meerkat'@'localhost';

FLUSH PRIVILEGES