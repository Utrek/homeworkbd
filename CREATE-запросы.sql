CREATE table if not EXISTS genres(
genre_id SERIAL PRIMARY KEY, 
name VARCHAR UNIQUE NOT NULL);

CREATE TABLE if not exists executors(
executor_id SERIAL PRIMARY KEY, 
name VARCHAR NOT null);

CREATE TABLE  if not exists executorsgenes (
genre_id INTEGER REFERENCES genres(genre_id),
executor_id INTEGER REFERENCES executors(executor_id),
constraint pk PRIMARY key (genre_id, executor_id));

CREATE TABLE if not exists albums (
album_id SERIAL PRIMARY KEY, 
name VARCHAR NOT null,
year_of_issue INTEGER not null CHECK (year_of_issue <= 2022));

CREATE TABLE  if not exists executorsalbums (
album_id INTEGER REFERENCES albums(album_id),
executor_id INTEGER REFERENCES executors(executor_id),
constraint pk1 PRIMARY key (album_id, executor_id));

CREATE TABLE if not exists treks (
trek_id SERIAL PRIMARY KEY, 
name VARCHAR NOT null,
Duration INTEGER not null CHECK (Duration <= 420),
album_id INTEGER not null REFERENCES albums(album_id));

CREATE TABLE if not exists collections (
collection_id SERIAL PRIMARY KEY, 
name VARCHAR NOT null,
year_of_issue INTEGER not null CHECK (year_of_issue <= 2022));


CREATE TABLE  if not exists trekscollections (
trek_id INTEGER REFERENCES treks(trek_id),
collection_id INTEGER REFERENCES collections(collection_id),
constraint uk PRIMARY key (trek_id, collection_id));














