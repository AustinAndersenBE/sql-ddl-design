DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE Region (
    region_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE User (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    preferred_region_id INT REFERENCES Region(region_id)
);

CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Post (
    post_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT,
    price NUMERIC(10, 2),
    user_id INT REFERENCES User(user_id),
    region_id INT REFERENCES Region(region_id),
    category_id INT REFERENCES Category(category_id)
)


-- Insert into Region
INSERT INTO Region (name) VALUES ('San Francisco'), ('Atlanta'), ('Seattle');

-- Insert into User
INSERT INTO User (username, preferred_region_id) VALUES ('john_doe', 1);

-- Insert into Category
INSERT INTO Category (name) VALUES ('Jobs'), ('Housing');


-- Insert into Post
INSERT INTO Post (title, text, price, user_id, region_id, category_id) VALUES ('Software Engineer Wanted', 'Looking for a skilled software engineer.', 100000.00, 1, 1, 1);


