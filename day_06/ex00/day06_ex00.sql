CREATE TABLE IF NOT EXISTS person_discounts
(
    id          SERIAL PRIMARY KEY,
    pizzeria_id INTEGER,
    person_id   INTEGER,
    discount    NUMERIC,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
    CONSTRAINT fk_pizzeria_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
);