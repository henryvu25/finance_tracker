CREATE DATABASE money;

CREATE TABLE accounts (
    account_id BIGSERIAL NOT NULL PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL,
    balance FLOAT NOT NULL,
    due_date DATE NOT NULL
);

CREATE TABLE plans (
    plan_id BIGSERIAL NOT NULL PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL,
    goal_amount FLOAT NOT NULL,
    goal_date DATE NOT NULL,
    account_id INT REFERENCES accounts(account_id)
);

CREATE TABLE bills (
    bill_id BIGSERIAL NOT NULL PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL,
    amount_due FLOAT NOT NULL,
    due_date DATE NOT NULL
);

CREATE TABLE users (
    user_id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password VARCHAR(50) NOT NULL,
    account_id INT REFERENCES accounts(account_id),
    plan_id INT REFERENCES plans(plan_id),
    bill_id INT REFERENCES bills(bill_id)
);