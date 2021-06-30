use albums_db;

select * from albums; #31

select distinct artist from albums; #23

describe albums; #id

select distinct release_date from albums; #1967 #2011

select  name from albums where artist = 'Pink Floyd'; #The Dark Side of the Moon The Wall

select release_date from albums where name = "Sgt. Pepper's lonely Hearts Club band"; #1967

select genre from albums where name = 'nevermind'; # Grunge, Alternative rock

select name from albums where release_date between 1990 and 1999; #11 albums

SELECT 
    id,
    name AS Album_Sales,
    sales AS Total_Sales
FROM albums
WHERE sales < 20;

select name from albums where genre = 'rock'; #It chooses specifically what you tell it. 



	

