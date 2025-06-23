
CREATE TABLE title_basics (
    tconst VARCHAR(12) PRIMARY KEY,
    title_type VARCHAR(20),
    primary_title VARCHAR(500),
    original_title VARCHAR(500),
    isAdult BOOLEAN,
    startYear INTEGER,
    endYear INTEGER,
    runtimeMinutes INTEGER,
    genres VARCHAR(100)
);

CREATE TABLE name_basics (
    nconst VARCHAR(12) PRIMARY KEY,
    primary_name VARCHAR(200),
    birth_year INTEGER,
    death_year INTEGER,
    primary_profession VARCHAR(200),
    known_for_titles VARCHAR(200)
);

CREATE TABLE title_akas (
    title_id VARCHAR(12),
    ordering INTEGER,
    title VARCHAR(1000),
    region VARCHAR(10),
    language VARCHAR(20),
    types VARCHAR(100),
    attributes VARCHAR(200),
    is_original_title BOOLEAN,
    PRIMARY KEY (title_id, ordering)
);

CREATE TABLE title_crew (
    tconst VARCHAR(12) PRIMARY KEY,
    directors text,
    writers text
);

CREATE TABLE title_episode (
    tconst VARCHAR(12) PRIMARY KEY,
    parent_tconst VARCHAR(12),
    season_number INTEGER,
    episode_number INTEGER
);

CREATE TABLE title_principals (
    tconst VARCHAR(12),
    ordering INTEGER,
    nconst VARCHAR(12),
    category VARCHAR(50),
    job text,
    characters VARCHAR(1000),
    PRIMARY KEY (tconst, ordering)
);

CREATE TABLE title_ratings (
    tconst VARCHAR(12) PRIMARY KEY,
    average_rating NUMERIC(3,1),
    num_votes INTEGER
);

