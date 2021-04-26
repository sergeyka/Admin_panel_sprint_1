CREATE SCHEMA IF NOT EXISTS content;

-- FILM WORK
CREATE TABLE IF NOT EXISTS content.film_work
(
    id          uuid PRIMARY KEY,
    title       text NOT NULL,
    description text,
    rating      double PRECISION
);

-- GENRE
CREATE TABLE IF NOT EXISTS content.genre
(
    id   uuid    PRIMARY KEY,
    name varchar NOT NULL UNIQUE
);

-- FILM WORK to GENRE
CREATE TABLE IF NOT EXISTS content.film_work_genre
(
    film_work_id uuid NOT NULL references content.film_work(id) ON DELETE CASCADE,
    genre_id     uuid NOT NULL references content.genre(id) ON DELETE CASCADE,
    UNIQUE (film_work_id, genre_id)
);


-- PERSON (actor, writer or director of the movie)
CREATE TABLE IF NOT EXISTS content.person
(
    id   uuid PRIMARY KEY,
    name varchar not null unique
);

-- FILM WORK to PERSON
CREATE TABLE IF NOT EXISTS content.film_work_person
(
    film_work_id uuid    NOT NULL references content.film_work(id) ON DELETE CASCADE,
    person_id    uuid    NOT NULL references content.person(id) ON DELETE CASCADE,
    "role"       varchar NOT NULL,
    UNIQUE (film_work_id, person_id, "role")
);
