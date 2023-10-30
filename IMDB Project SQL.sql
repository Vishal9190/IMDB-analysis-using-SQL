#-	1.1What are the different tables in the database and how are they connected to each other in the database?
we have tables director_mapping,genre,movies,names,ratings,role_mapping.
director_mapping is connected to movies by  movie_id 
director_mapping is connected to names  by name_id 

genre is connected to movies by movie_id 
movies is connected to genre,ratings,director_mapping,role_mapping by movie_id
names  is connected to role_mapping and director_mapping by name_id

ratings is connected to movies by movie_id 

role_mapping is connected to movies by movie_id
role_mapping is connected to names by name_id

#-1.2Find the total number of rows in each table of the schema.
select count(*) as no_of_rows_of_director_mapping
from director_mapping;
# There are 3867 rows in director_mapping table

select count(*) as no_of_row_of_gnere
from genre;
# There are 14662 rows in genre table

select count(*) as no_of_row_of_movie
from movies;
#There are 7997 rows in movies table

select count(*) as no_of_row_of_names
from names;
#There are 25735 rows in names table

select count(*) as no_of_row_of_ratings
from ratings;
#There are 7997 rows in ratings table

select count(*) as no_of_row_of_role_mapping
from role_mapping;
#There are 15615 rows in role_mapping table

#1.3identify which columns in the movie table have null values.
 
 select id from movies where id is null
 # id has no null values
 
 select title from movies where title is null
 # title has no null values
 
 select year from movies where year is null
 #year has no null values
 
 select date_published from movies where date_published is null
 #date_published has no null values
 
 select duration from movies where duration is null
 #duration has no null values
 
 select country from movies where country is null
 #country has null values
 
 select worlwide_gross_income from movies where worlwide_gross_income is null
 #worlwide_gross_income has null values
 
 select languages from movies where languages is null
 #languages has null values
 
 select production_company from movies where production_company is null
 #production_company has null values
 
 # country,worlwide_gross_income,languages and production_company has null values
 
#-	2.1Determine the total number of movies released each year and analyse the month-wise trend.
select count(*)  as total_num_of_movies, month(STR_to_date(date_published,'%d-%m-%Y')) as month,year
from movies 
group by year ,month
order by year asc ,month

# In 2017, 3052 movies were released
#  In 2018 , 2944 movies were released
 # In 2019, 2001 movies were released

#2.2-	Calculate the number of movies produced in the USA or India in the year 2019

select count(title) as num_of_movies from movies
where year = 2019 and (lower(country) like '%usa%' or lower(country) like '%india%') ;

# 1059 is the number of movies produced in the USA or India in the year 2019

#3.1 Retrieve the unique list of genres present in the dataset.
select  distinct(genre)
 from genre
 
 #there are 13 unique genres 


#3.2 Identify the genre with the highest number of movies produced overall.
select count(m.title) as num_of_movies,
g.genre
from movies m
inner join genre g on g.movie_id=m.id
group by g.genre
order by num_of_movies desc
limit 1

# Drama is the genre with the highest number of movies produced

#3.3 Determine the count of movies that belong to only one genre.
select count(*) as num_of_movies from (
select count(g.genre)as num_of_genre,m.title
from movies m
join genre g on g.movie_id=m.id
group by m.title
having num_of_genre=1) t

# 3245 is the count of movies that belongs to only one genre

#3.4-	Calculate the average duration of movies in each genre.
select avg(m.duration) as avg_duration, g.genre
from movies m
join genre  g on g.movie_id=m.id
group by g.genre order by avg_duration desc

# action genre has highest average duration and Horror has lowest average duration

#3.5 -	Find the rank of the 'thriller' genre among all genres in terms of the number of movies produced.

with rank_of_genre as(select genre,count(movie_id) as num_of_movies,rank() over(order by count(movie_id) desc ) as rnk
from genre g join movies m on m.id=g.movie_id
group by genre
order by num_of_movies desc)
select rnk from rank_of_genre where lower(genre)='Thriller'

# rank of thriller is 3

#4.1 Retrieve the minimum and maximum values in each column of the ratings table (except movie_id).

SELECT
MIN(avg_rating) AS min_avg_rating,MAX(avg_rating) AS max_avg_rating,
MIN(total_votes) AS min_total_votes,MAX(total_votes) AS max_total_votes,
MIN(median_rating) AS min_median_rating,MAX(median_rating) AS max_median_rating
FROM ratings;
# minimum avg_rating is 1 and maximum avg_rating is 10
# minimum total_votes is 100 and maximum total_votes is 725138
# minimum median_rating is 1 and  maximum median_rating is 10

#4.2 Identify the top 10 movies based on average rating.
select title,avg_rating from ratings r 
inner join movies m on m.id=r.movie_id
order by avg_rating desc
limit 10

# Love in Kilnerry and Kirket has maximum average rating of 10

#4.3 Summarise the ratings table based on movie counts by median ratings.
select count(movie_id)as movie_count,median_rating from ratings 
group by median_rating
order by median_rating desc

# 346 movies has median_rating of 10

#4.4 Identify the production house that has produced the most number of hit movies (average rating > 8).
select production_company from 
(select
production_company,
count(id) as num_of_movies
from movies m
join ratings r on r.movie_id=m.id
where production_company is not null  and avg_rating>8
group by production_company
order by num_of_movies desc) t
limit 1

# Dream Warrior Pictures has produced the most number of hit movies

#4.5 Determine the number of movies released in each genre during March 2017 in the USA with more than 1,000 votes.
 select genre,count(*) as num_of_movies
from movies m join ratings r on r.movie_id=m.id join genre g on g.movie_id=m.id 
where country like'%USA%' and date_published like '____3_2017' and total_votes>1000
group by genre 
order by num_of_movies desc 

# Drama has maximum number which is 24 movies which are released during March 2017 in the USA with more than 1,000 votes.

        
#4.6 Retrieve movies of each genre starting with the word 'The' and having an average rating > 8.
select title,avg_rating,genre
from movies m join genre g on g.movie_id=m.id join ratings r on r.movie_id=m.id
where avg_rating>8 and lower(title) like '%The%'

#The Blue Elephant 2
#National Theatre Live: Fleabag
#The Brighton Miracle
#The Irishman
#Spider-Man: Into the Spider-Verse
#Baahubali 2: The Conclusion
#One Step Behind the Seraphim
#The Colour of Darkness
#Stadium Anthems
#Ayla: The Daughter of War
#Leera the Soulmate
#Ondu Motteya Kathe
#National Theatre Live: Rosencrantz & Guildenstern Are Dead
#National Theatre Live: Angels in America Part One - Millennium Approaches
#National Theatre Live: Angels in America Part Two - Perestroika
#Harry Styles: Behind the Album
#Theeran Adhigaaram Ondru
#National Theatre Live: Follies
#The Mystery of Godliness: The Sequel
#An American in Paris: The Musical
#Spiele mit Bart: The Movie feat. Night Trap
#Spirits in the Dark
#Distant Sky - Nick Cave & The Bad Seeds Live in Copenhagen
#Uri: The Surgical Strike
#The Gambinos
#Sense8: The Series Finale Official Trailer
#10 Days Before the Wedding
#The King and I
#And Then We Danced
#National Theatre Live: King Lear
#Aickarakkonathe Bhishaguaranmaar
#Gini Helida Kathe
#National Theatre Live: All About Eve

#5.1-	Identify the columns in the names table that have null values.
select id from names where id is null
select name from names where name is null
select height from names where height is null
select date_of_birth from names where date_of_birth is null
select known_for_movies from names where known_for_movies is null

# height ,date_of_birth,known_for_movies has null values 

#5.2 -	Determine the top three directors in the top three genres with movies having an average rating > 8.
with top_genre as(
select genre , count(g.movie_id) as num_of_movies
from genre g inner join ratings r on r.movie_id=g.movie_id
where avg_rating>8
group by genre order by num_of_movies desc limit 3)

select n.name as top_director ,count(m.id) as count_of_movies 
from names n inner join director_mapping dm on dm.name_id=n.id
inner join movies m on m.id=dm.movie_id 
inner join genre g on g.movie_id = m.id 
inner join ratings r on r.movie_id=m.id
where avg_rating>8 and genre in (select genre from top_genre)
group by n.name
order by count_of_movies desc limit 3;

#James Mangold is the top director 



#5.3-	Find the top two actors whose movies have a median rating >= 8.
select n.name, count(rm.movie_id) as total_movies from names n 
join role_mapping rm on n.id=rm.name_id
join ratings r on r.movie_id=rm.movie_id where r.median_rating >= 8 and category='actor'
group by n.name 
order by total_movies desc 
limit 2;

# Mohanlal and mamooty are the top actors

#5.4 Identify the top three production houses based on the number of votes received by their movies.
select production_company,sum(total_votes) as num_of_votes from movies m join ratings r on r.movie_id=m.id
group by production_company
having production_company is not null
order by num_of_votes desc
limit 3

# Marvel Studios, Twentieth Century Fox, Warner Bros are the top three production houses nased on the number of votes

#5.5 Rank actors based on their average ratings in Indian movies released in India.
select n.name as actor_name,sum( total_votes) as total_votes, count(r.movie_id) as movie_count,
round(sum(avg_rating*total_votes)/sum(total_votes),2) as actor_avg_rating,
row_number() over(order by round(sum(avg_rating*total_votes)/sum(total_votes),2)   desc, count(r.movie_id) desc) as ranking
from movies as  m join ratings as r on m.id=r.movie_id
join role_mapping as rm on m.id=rm.movie_id
join names as n on rm.name_id=n.id
where country like 'India' and category ='actor'
group by name
having movie_count >= 5;
# Vijay Sethupathi is the top actor having average rating of 8.42 and Prabhu Deva is the worst actor having average rating of 5.68

#5.6 Identify the top five actresses in Hindi movies released in India based on their average ratings.
with hindi_actress_rank as
	(select n.name as actress_name,
		sum( total_votes) as total_votes, 
		count(r.movie_id) as movie_count, 	
		round(sum(avg_rating*total_votes)/sum(total_votes),2) as actress_avg_rating
	from movies as  m
	join ratings as r on m.id=r.movie_id
	join role_mapping as rm on m.id=rm.movie_id
	join names as n on rm.name_id=n.id
	where country like 'India' and category ='actress' and languages='hindi'
	group by name
	)
    select * , rank () over (order by actress_avg_rating desc,total_votes desc) as actress_rank
from hindi_actress_rank where movie_count>=2;
 
# Yami Gautam,Tapsee Pannu,Bhumi Pednekar,Anjali Patil,Shraddha Kapoor are the top five actresses


#6.1-	Classify thriller movies based on average ratings into different categories.
select title,avg_rating ,
case when avg_rating>8 then 'Superhit'
	when avg_rating between 7.0 and 8.0 then 'Hit'
	when avg_rating between 5.0 and 7.0 then 'One Time Watch'
    else 'Flop' end Category 
from genre g join movies m on m.id=g.movie_id join ratings r on r.movie_id=g.movie_id
where genre = 'Thriller' and total_votes>25000

# Joker, Andhadun, contratiempo and Ah-ga-ssi are Superhit movies with the good ratings
# The Belko Experiment,The Autopsy of Jane doe are One Time watch movies with the good ratings
# Brimstone, Elle, Miss Sloane, Split are hit movies with the good ratings
# Fifty Shades Freed, Race3, The Open house are Flop movies

#6.2-	analyse the genre-wise running total and moving average of the average movie duration.

 with genre_summary as 
(select genre,avg(duration) as avg_duration from  genre g left join 
movies m on g.movie_id=m.id
group by genre)
select genre,avg_duration,sum(avg_duration) over (order by avg_duration desc) as running_total,
avg(avg_duration) over (order by avg_duration desc) as moving_average from genre_summary;

#Horror has the highest running total and Action has highest moving average and Average duration

#6.3-	Identify the five highest-grossing movies of each year that belong to the top three genres.
with top_genre as
(select genre,count(m.id) as movie_count
from genre g left join movies m on g.movie_id=m.id
group by genre 
order by movie_count desc 
limit 3)
select * from (
select genre,year,m.title as movie_name,
worlwide_gross_income, 
rank() over (partition by genre,year order by cast(replace(trim(worlwide_gross_income),"$ " , "")as unsigned)
desc) as movie_rank 
from movies m inner join genre g on g.movie_id=m.id 

where g.genre in (select genre from top_genre)) t
where movie_rank <=5;

-- genre, year, movie_name, worlwide_gross_income, movie_rank
-- 'Comedy', '2017', 'Despicable Me 3', '$ 1034799409', '1'
-- 'Comedy', '2017', 'Jumanji: Welcome to the Jungle', '$ 962102237', '2'
-- 'Drama', '2017', 'Zhan lang II', '$ 870325439', '1'
-- 'Drama', '2017', 'Logan', '$ 619021436', '2'
-- 'Thriller', '2017', 'The Fate of the Furious', '$ 1236005118', '1'
-- 'Thriller', '2017', 'Zhan lang II', '$ 870325439', '2'





#6.4-	Determine the top two production houses that have produced the highest number of hits among multilingual movies.
select m.production_company,
count(m.id) as movie_count,
rank() over(order by count(m.id)desc ) as prod_rank
from movies m left join ratings r on r.movie_id=m.id
where production_company is not null and median_rating > 8
and languages like "%,%"
group by production_company
limit 2
#Star Cinema and Ave Fenix Pictures are the top two production houses 

#6.5-	Identify the top three actresses based on the number of Super Hit movies (average rating > 8) in the drama genre.
select name, count(rm.movie_id) count_of_superhit_movies from names n
join role_mapping rm on n.id = rm.name_id
join ratings r on r.movie_id = rm.movie_id
join genre g on g.movie_id = rm.movie_id
where avg_rating > 8 and category = 'actress' and genre = 'drama'
group by name
order by count_of_superhit_movies desc
limit 3;

#Parvathy Thiruvothu, Susan Brown, Denise Gough are the top three actresses

#6.6-	Retrieve details for the top nine directors based on the number of movies, 
including average inter-movie duration, ratings, and more.

with top_directors as 
(
select director_id,director_name from (
select n.id as director_id,n.name as director_name,count(m.id) as movie_count,
row_number() over(order by count(m.id) desc) as director_rank from names n
inner join director_mapping d on n.id=d.name_id
inner join movies m on m.id=d.movie_id
group by 1,2)t where director_rank <=9),

movie_summary as ( select n.id as director_id,n.name as director_name,m.id as movie_id,r.avg_rating,r.total_votes,
m.duration,m.date_published, lead(date_published) over(partition by n.id order by m.date_published) as next_date_published,
DATEDIFF(lead(date_published) over(partition by n.id order by m.date_published),
m.date_published) AS INTER_MOVIE_DAYS
from names n
inner join director_mapping d on n.id=d.name_id
inner join movies m on m.id=d.movie_id
inner join ratings r on r.movie_id=m.id
where n.id in (select director_id from top_directors))

select director_id,director_name,count(distinct movie_id) as number_of_movies,avg(inter_movie_days)as avg_inter_movie_days,
round(sum(avg_rating*total_votes)/sum(total_votes),2) as directors_avg_rating,
sum(total_votes) as total_votes,sum(avg_rating) as min_rating,max(avg_rating) as max_rating,sum(duration) as total_movie_duration
from movie_summary 
group by 1,2
order by number_of_movies desc,directors_avg_rating desc

# Top Nine Directors are 
#1 A.L. Vijay
#2 Andrew Jones
#3 Steven Soderbergh
#4 Sam Liu
#5 Sion Sono
#6 Jesse V. Johnson
#7 Justin Price
#8 Chris Stokes
#9 Özgür Bakar

#7.1-	Based on the analysis, provide recommendations for the types of content Bolly movies should focus on producing.
select title ,worlwide_gross_income,country,genre,avg_rating from movies m join genre g on g.movie_id=m.id join ratings r on r.movie_id=m.id
where country = 'India' and worlwide_gross_income is not null
order by worlwide_gross_income desc,avg_rating desc 
limit 10

# Action,Thriller,Drama are the types of Bolly movies which should focus on producing
