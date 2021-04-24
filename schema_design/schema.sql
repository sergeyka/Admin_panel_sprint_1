create schema if not exists content;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

create table if not exists content.film_work
(
    id            uuid not null
        constraint film_work_pkey primary key,
    title         text not null,
    description   text,
    rating        double precision
);


-- GENRE
create table if not exists content.genre
(
    id    uuid    not null primary key,
    name varchar not null unique
);

create table if not exists content.film_work_genre
(
    film_work_id uuid not null,
    genre_id        text,
    unique (film_work_id, genre_id)
);


-- PERSON (actor, writer or director of the movie)
CREATE TABLE if not exists content.person
(
    id   uuid PRIMARY KEY,
    name varchar not null unique
);

create table if not exists content.film_work_person
(
    film_work_id uuid    not null,
    person_id    uuid    not null,
    "role"       varchar not null,
    unique (film_work_id, person_id, "role")
);
