use WorldEvents
use DoctorWho
Select * FROM tblCategory;

Select * FROM tblContinent;

SELECT CountryName FROM tblCountry
WHERE ContinentId=1
ORDER BY CountryName;

Select * FROM tblEvent 
WHERE CountryId=1;



--Create a stored procedure called uspCountriesAsia to list out all the countries with ContinentId equal to 1, in alphabetical order

CREATE PROC uspCountriesAsia
as
BEGIN
		SELECT CountryName FROM tblCountry
		WHERE ContinentId=1
		ORDER BY CountryName;
END

EXECUTE uspCountriesAsia;

SELECT AuthorId FROM tblAuthor
WHERE AuthorName='Steven Moffat';

SELECT * FROM tblAuthor;
SELECT * FROM tblEpisode;

--Using the tblAuthor and tblEpisode tables, create a stored procedure called spMoffats to list out the 32 episodes written by Steven Moffat in date order (with the most recent first):

CREATE PROC spMoffats
as
BEGIN
		SELECT Title,EpisodeDate FROM tblEpisode
		WHERE AuthorId=(SELECT AuthorId FROM tblAuthor
		WHERE AuthorName='Steven Moffat')
		ORDER BY EpisodeDate DESC;
END

EXECUTE spMoffats;