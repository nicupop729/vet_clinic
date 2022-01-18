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
)
