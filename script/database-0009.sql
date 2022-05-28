CREATE table admin(
    id varchar(15) primary key,
    login varchar(100),
    mdp varchar(255)
);


-- hashing
CREATE EXTENSION pgcrypto;

CREATE OR REPLACE FUNCTION sha256(varchar) returns text AS $$
    SELECT encode(digest($1, 'sha256'), 'hex')
$$ LANGUAGE SQL STRICT IMMUTABLE;


INSERT INTO admin VALUES ('ADM1','adm1@gmail.com',sha256('motdepasse'));
