ALTER TABLE "Productioncompany"
ADD PRIMARY KEY(id);

ALTER TABLE "Movie_Productioncompanies"
ADD FOREIGN KEY (pc_id) REFERENCES "Productioncompany"(id);

ALTER TABLE "Genre"
ADD PRIMARY KEY(id);

ALTER TABLE "Movie_genres"
ADD FOREIGN KEY (genre_id) REFERENCES "Genre"(id);


ALTER TABLE "Collection"
ADD PRIMARY KEY(id);

ALTER TABLE "Movie_collection"
ADD FOREIGN KEY (collection_id) REFERENCES "Collection"(id);


ALTER TABLE "Ratings"
ADD PRIMARY KEY(user_id, movie_id);




#syndesh me movie


ALTER TABLE "Movie"
ADD PRIMARY KEY(id);

ALTER TABLE "Movie_collection"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id);

ALTER TABLE "Movie_Productioncompanies"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id);

ALTER TABLE "Movie_cast"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id);

ALTER TABLE "Movie_genres"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id);

ALTER TABLE "Movie_crew"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id);

ALTER TABLE "Ratings"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id);