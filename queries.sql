--3-------------------------------
CREATE TABLE title_basics (
tconst VARCHAR(12) PRIMARY KEY,
title_type VARCHAR(20),
primary_title VARCHAR(500),
original_title VARCHAR(500),
is_adult BOOLEAN,
start_year INTEGER,
end_year INTEGER,
runtime_minutes INTEGER,
genres VARCHAR(100)
);

CREATE TABLE title_akas (
    titleId VARCHAR(12),
    ordering INTEGER,
    title TEXT,
    region VARCHAR(4),
    language VARCHAR(3),
    types VARCHAR(20),
    attributes VARCHAR(200),
    is_original_title BOOLEAN,
    PRIMARY KEY (titleId, ordering)
);

CREATE TABLE title_crew (
    tconst VARCHAR(12) PRIMARY KEY,
    directors TEXT,
    writers TEXT
);

CREATE TABLE title_episode (
    tconst VARCHAR(12) PRIMARY KEY,
    parentTconst VARCHAR(12),
    seasonNumber INTEGER,
    episodeNumber INTEGER
);

CREATE TABLE title_principals (
    tconst VARCHAR(12),
    ordering INTEGER,
    nconst VARCHAR(12),
    category VARCHAR(20),
    job TEXT,
    characters TEXT,
    PRIMARY KEY (tconst, ordering)
);

CREATE TABLE title_ratings (
    tconst VARCHAR(12) PRIMARY KEY,
    average_rating DECIMAL(3,1),
    num_votes INTEGER
);

CREATE TABLE name_basics (
    nconst VARCHAR(12) PRIMARY KEY,
    primary_name VARCHAR(200),
    birth_year INTEGER,
    death_year INTEGER,
    primary_profession VARCHAR(200),
    known_for_titles TEXT
);

--4-------------------------------
COPY title_basics FROM PROGRAM 'zcat /import/title.basics.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

COPY title_ratings FROM PROGRAM 'zcat /import/title.ratings.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

COPY title_akas FROM PROGRAM 'zcat /import/title.akas.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

COPY title_crew FROM PROGRAM 'zcat /import/title.crew.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

COPY title_episode FROM PROGRAM 'zcat /import/title.episode.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

COPY title_principals FROM PROGRAM 'zcat /import/title.principals.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

COPY name_basics FROM PROGRAM 'zcat /import/name.basics.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');
