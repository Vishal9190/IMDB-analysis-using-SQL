**IMDB Analysis using SQL**
-  The objective of this project is to analyse the movie dataset using SQL queries and extract valuable insights to guide Bolly Movies in planning their new project. 
This project provides key insights into the movie industry based on data from several tables, including director_mapping, genre, movies, names, ratings, and role_mapping. The data includes information about movies, their genres, directors, ratings, and more.

## Data Overview

- **Director Mapping Table:** Contains 3,867 rows and connects movies to directors via `movie_id` and names via `name_id`.
- **Genre Table:** Contains 14,662 rows, and movies are linked to genres via `movie_id`.
- **Movies Table:** Contains 7,997 rows and connects movies to genre, ratings, director mapping, and role mapping via `movie_id`.
- **Names Table:** Contains 25,735 rows and connects to role mapping and director mapping via `name_id`.
- **Ratings Table:** Contains 7,997 rows and links to movies via `movie_id`.
- **Role Mapping Table:** Contains 15,615 rows and connects to movies via `movie_id` and to names via `name_id`.

## Insights

### Movie Releases by Year

- In 2017, 3,052 movies were released.
- In 2018, 2,944 movies were released.
- In 2019, 2,001 movies were released.
- 1,059 movies were produced in the USA or India in 2019.

### Movie Genres

- There are 13 unique movie genres.
- Drama is the genre with the highest number of movies produced.
- Suggested Bollywood genres to focus on: Action, Thriller, and Drama.

### Movie Durations

- Action genre has the highest average duration.
- Horror genre has the lowest average duration.

### Movie Ratings

- The minimum average rating is 1, and the maximum average rating is 10.
- The minimum total votes for a movie is 100, and the maximum total votes is 725,138.
- The minimum median rating is 1, and the maximum median rating is 10.
- "Love in Kilnerry" and "Kirket" have the maximum average rating of 10.
- 346 movies have a median rating of 10.

### Top Production Houses

- Dream Warrior Pictures has produced the most number of hit movies.
- Top three production houses based on the number of votes: Marvel Studios, Twentieth Century Fox, and Warner Bros.
- Other top production houses include Star Cinema and Ave Fenix Pictures.

### Top Directors

- The top director is A.L. Vijay.
- Other top directors include Andrew Jones, Steven Soderbergh, Sam Liu, Sion Sono, Jesse V. Johnson, Justin Price, Chris Stokes, and Özgür Bakar.

### Top Actors and Actresses

- Top actors: Mohanlal and Mamooty.
- Vijay Sethupathi has the highest average rating among actors.
- Prabhu Deva has the lowest average rating among actors.
- Top actresses: Yami Gautam, Taapsee Pannu, Bhumi Pednekar, Anjali Patil, and Shraddha Kapoor.
- Top three actresses: Parvathy Thiruvothu, Susan Brown, and Denise Gough.

### Movies with Ratings

- Superhit movies with good ratings: "Joker," "Andhadhun," "Contratiempo," and "Ah-ga-ssi."
- One Time watch movies with good ratings: "The Belko Experiment" and "The Autopsy of Jane Doe."
- Hit movies with good ratings: "Brimstone," "Elle," "Miss Sloane," and "Split."
- Flop movies: "Fifty Shades Freed," "Race 3," and "The Open House."

### Genre Insights

- Horror has the highest running total in terms of movies.
- Action has the highest moving average in terms of movies.
- Suggested Bollywood genre focus: Drama, Action, and Thriller.

## Conclusion

This project provides a comprehensive overview of the movie industry, including details on movie releases, genres, ratings, top production houses, directors, actors, actresses, and genre recommendations. These insights can be used for decision-making and strategy in the movie industry.
