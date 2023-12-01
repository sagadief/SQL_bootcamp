CREATE TABLE person_audit (
    created     timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event  char(1) DEFAULT 'I' CHECK (type_event IN ('U', 'I', 'D')),
    row_id      bigint NOT NULL,
    name        varchar,
    age         integer,
    gender      varchar,
    address     varchar
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    RETURNS TRIGGER AS $trg_person_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit
        VALUES (DEFAULT, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    END IF;
    RETURN NULL;
END;
$trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person (id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

