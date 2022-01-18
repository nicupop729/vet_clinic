CREATE TABLE patients (
    id SERIAL,
    name VARCHAR(100),
    date_of_birth DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id SERIAL,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE treatments (
    id SERIAL,
    type VARCHAR(50),
    name VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id SERIAL,
    unit_price decimal,
    quantity INT,
    total_price decimal,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
    id SERIAL,
    total_amount decimal,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY (id)
);

ALTER TABLE medical_histories
ADD CONSTRAINT medical_fk FOREIGN KEY (patient_id) REFERENCES patients (id);

ALTER TABLE invoice_items
ADD CONSTRAINT invoice_fk FOREIGN KEY (invoice_id) REFERENCES invoices (id);

ALTER TABLE invoice_items
ADD CONSTRAINT treatment_fk FOREIGN KEY (treatment_id) REFERENCES treatments (id);

ALTER TABLE invoices
ADD CONSTRAINT medical_invoice_fk FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);

CREATE TABLE medical_history_treatments (
    id SERIAL PRIMARY KEY,
    medical_history_id INT,
    treatment_id INT,
    CONSTRAINT medical_history_fk
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT treatment_fk
    FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);

SELECT * FROM medical_histories
INNER JOIN medical_history_treatments
ON medical_histories.id = medical_history_treatments.medical_history_id
INNER JOIN treatments
ON medical_history_treatments.treatments_id = treatments.id;
