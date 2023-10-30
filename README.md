IMDB Analysis using SQL
-  The objective of this project is to analyse the movie dataset using SQL queries and extract valuable insights to guide Bolly Movies in planning their new project. 
This project provides key insights into the movie industry based on data from several tables, including director_mapping, genre, movies, names, ratings, and role_mapping. The data includes information about movies, their genres, directors, ratings, and more.

## Data Overview

- **Director Mapping Table:** Contains 3,867 rows and connects movies to directors via `movie_id` and names via `name_id`.
- **Genre Table:** Contains 14,662 rows, and movies are linked to genres via `movie_id`.
- **Movies Table:** Contains 7,997 rows and connects movies to genre, ratings, director mapping, and role mapping via `movie_id`.
- **Names Table:** Contains 25,735 rows and connects to role mapping and director mapping via `name_id`.
- **Ratings Table:** Contains 7,997 rows and links to movies via `movie_id`.
- **Role Mapping Table:** Contains 15,615 rows and connects to movies via `movie_id` and to names via `name_id`.
