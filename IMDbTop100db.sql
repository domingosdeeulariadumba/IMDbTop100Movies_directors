/*Continuing to collect the data concerning the IMDb Top 100 movies with Python (Spyder IDE), below we first create the respective database and lastly its two tables.
The first stores informations about directors and stars whereas the second has information about the country and financial aspects of the movie.*/




-- Creating the database --
CREATE DATABASE IMDbTop100_db;



-- Creating the first table --
CREATE TABLE directors_and_stars (
id INT IDENTITY (1,1) PRIMARY KEY,
director VARCHAR (35),
stars VARCHAR (75));



-- Storing information into the first table --


INSERT INTO IMDbTop100_db.dbo.directors_and_stars (director, stars)
VALUES ('Frank Darabont', 'Tim Robbins, Morgan Freeman, Bob Gunton'), ('Francis Ford Coppola', 'Marlon Brando, Al Pacino, James Caan'),
('Christopher Nolan', 'Christian Bale, Heath Ledger, Aaron Eckhart'), ('Francis Ford Coppola', 'Al Pacino, Robert De Niro, Robert Duvall'),
('Sidney Lumet', 'Henry Fonda, Lee J. Cobb, Martin Balsam'), ('Steven Spielberg', 'Liam Neeson, Ralph Fiennes, Ben Kingsley'),
('Peter Jackson', 'Elijah Wood, Viggo Mortensen, Ian McKellen'), ('Quentin Tarantino', 'John Travolta, Uma Thurman, Samuel L. Jackson'),
('Peter Jackson', 'Elijah Wood, Ian McKellen, Orlando Bloom'), ('Sergio Leone', 'Clint Eastwood, Eli Wallach, Lee Van Cleef'),
('Robert Zemeckis', 'Tom Hanks, Robin Wright, Gary Sinise'), ('David Fincher', 'Brad Pitt, Edward Norton, Meat Loaf'),
('Peter Jackson', 'Elijah Wood, Ian McKellen, Viggo Mortensen'), ('Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page'),
('Irvin Kershner', 'TMark Hamill, Harrison Ford, Carrie Fisher'), ('Lana Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss'),
('Martin Scorsese', 'Robert De Niro, Ray Liotta, Joe Pesci'), ('Milos Forman', 'Jack Nicholson, Louise Fletcher, Michael Berryman'),
('Joaquim Dos Santos', 'Shameik Moore Hailee Steinfeld, Brian Tyree Henry'), ('David Fincher', 'Morgan Freeman, Brad Pitt, Kevin Spacey'),
('Frank Capra', 'James Stewart, Donna Reed, Lionel Barrymore'), ('Akira Kurosawa', 'MifuneTakashi, Shimura, Keiko Tsushima'),
('Jonathan Demme', 'Jodie Foster, Anthony Hopkins, Lawrence A. Bonney'), ('Christopher Nolan', 'McConaughey, Anne Hathaway, Jessica Chastain'),
('Steven Spielberg', 'Tom Hanks, Matt Damon, Tom Sizemore'), ('Fernando Meirelles', 'Alexandre Rodrigues, Leandro Firmino, Matheus Nachtergaele'),
('Roberto Benigni', 'Roberto Benigni, Nicoletta Braschi, Giorgio Cantarini'), ('Frank Darabont', 'Tom Hanks, Michael Clarke Duncan, David Morse'),
('George Lucas', 'Mark Hamill, Harrison Ford, Carrie Fisher'), ('James Cameron', 'Arnold Schwarzenegger, Linda Hamilton, Edward Furlong'),
('Robert Zemeckis', 'Michael J. Fox, Christopher Lloyd, Lea Thompson'), ('Hayao Miyazaki', 'Daveigh Chase, Suzanne Pleshette, Miyu Irino'),
('Roman Polanski', 'Adrien Brody, Thomas Kretschmann Frank Finlay'), ('Alfred Hitchcock', 'Anthony Perkins, Janet Leigh, Vera Miles'),
('Bong Joon Ho', 'Song Kang-hoLee, Sun-kyunCho, Yeo-jeong'), ('Ridley Scott', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen'),
('Roger Allers', 'Matthew Broderick, Jeremy Irons, James Earl Jones'), ('Luc Besson', 'Jean Reno, Gary Oldman, Natalie Portman'),
('Tony Kaye', 'Edward Norton, Edward Furlong, Beverly DAngelo'), ('Martin Scorsese', 'Leonardo DiCaprio, Matt Damon, Jack Nicholson'),
('Damien Chazelle', 'Miles Teller, J.K. Simmons, Melissa Benoist'), ('Christopher Nolan', 'Christian Bale, Hugh Jackman, Scarlett Johansson'),
('Christopher Nolan', 'Cillian Murphy, Emily Blunt, Matt Damon'), ('Bryan Singer', 'Kevin Spacey, Gabriel Byrne, Chazz Palminteri'),
('Isao Takahata', 'Tsutomu Tatsumi, Ayano Shiraishi, Akemi Yamaguchi'), ('Masaki Kobayashi', 'Tatsuya Nakadai, Akira Ishihama, Shima Iwashita'),
('Michael Curtiz', 'Humphrey Bogart, Ingrid Bergman, Paul Henreid'), ('Olivier Nakache', 'François Cluzet, Omar Sy, Anne Le Ny'),
('Charles Chaplin', 'Charles Chaplin, Paulette Goddard, Henry Bergman'), ('Giuseppe Tornatore', 'Philippe Noiret, Enzo Cannavale, Antonella Attili'), 
('Sergio Leone', 'Henry Fonda, Charles Bronson, Claudia Cardinale'), ('Alfred Hitchcock', 'James Stewart, Grace Kelly, Wendell Corey'),
('Ridley Scott', 'Sigourney Weaver, Tom Skerritt, John Hurts'), ('Charles Chaplin', 'Charles Chaplin, Virginia Cherrill, Florence Lee'),
('Francis Ford Coppola', 'Martin Sheen, Marlon Brando, Robert Duvall'), ('Christopher Nolan', 'Guy Pearce, Carrie-Anne Moss, Joe Pantoliano'), 
('Quentin Tarantino', 'Jamie Foxx, Christoph Waltz, Leonardo DiCaprio'), ('Steven Spielberg', 'Harrison Ford, Karen Allen, Paul Freeman'), 
('Andrew Stanton', 'Ben Burtt, Elissa Knight, Jeff Garlin'), ('Florian Henckel von Donnersmarck', 'Ulrich MüheMartina GedeckSebastian Koch'),
('Billy Wilder', 'William Holden, Gloria Swanson, Erich von Stroheim'), ('Stanley Kubrick', 'Kirk Douglas, Ralph Meeker, Adolphe Menjous'),
('Anthony Russo', 'Robert Downey Jr.Chris HemsworthMark Ruffalo'), ('Stanley Kubrick', 'Jack Nicholson, Shelley Duvall, Danny Lloyd'),
('Charles Chaplin', 'Charles Chaplin, Paulette Goddard, Jack Oakie'), ('Billy Wilder', 'Tyrone Power, Marlene Dietrich, Charles Laughton'),
('Bob Persichetti', 'Shameik Moore, Jake Johnson, Hailee Steinfeld'), ('James Cameron', 'Sigourney Weaver, Michael Biehn, Carrie Henn'),
('Christopher Nolan', 'Christian Bale, Tom Hardy, Anne Hathaway'), ('Quentin Tarantino', 'Brad Pitt, Diane Kruger, Eli Roth'),
('Sam Mendes', 'Kevin Spacey, Annette Bening, Thora Birch'), ('Stanley Kubrick', 'Peter Sellers, George C. Scott, Sterling Hayden'),
('Park Chan-wook', 'Choi Min-sik, Yoo Ji-tae, Kang Hye-jeong'), ('Lee Unkrich', 'Anthony Gonzalez, Gael García Bernal, Benjamin Bratt'), 
('Milos Forman', 'F. Murray, AbrahamTom Hulce, Elizabeth Berridge'), ('John Lasseter', 'Tom Hanks, Tim Allen, Don Rickles'), 
('Wolfgang Petersen', 'Jürgen Prochnow, Herbert Grönemeyer, Klaus Wennemann'), ('Mel Gibson', 'Mel Gibson, Sophie Marceau, Patrick McGoohan'),
('Anthony Russo', 'Robert Downey Jr., Chris Evans, Mark Ruffalo'), ('Todd Phillips', 'Joaquin Phoenix, Robert De Niro, Zazie Beetz'),
('Hayao Miyazaki', 'Yôji Matsuda, Yuriko Ishida, Yûko Tanaka'), ('Gus Van Sant', 'Robin Williams, Matt Damon, Ben Affleck'),
('Sergio Leone', 'Robert De Niro, James Woods, Elizabeth McGoverns'), ('Makoto Shinkai', 'Ryunosuke Kamiki, Mone Kamishiraishi, Ryo Narita'),
('Rajkumar Hirani', 'Aamir Khan, Madhavan, Mona Singh'), ('Akira Kurosawa', 'Toshirô Mifune, Yutaka Sada, Tatsuya Nakadai'),
('Stanley Donen', 'Gene Kelly, Donald OConnor, Debbie Reynolds'), ('Darren Aronofsky', 'Ellen Burstyn, Jared Leto, Jennifer Connelly'),
('Nadine Labaki', 'Zain Al Rafeea, Yordanos Shiferaw, Boluwatife Treasure Bankole'), ('Lee Unkrich', 'Tom Hanks, Tim Allen, Joan Cusack'),
('Elem Klimov', 'Aleksey Kravchenko, Olga Mironova, Liubomiras Laucevicius'), ('Richard Marquand', 'Mark Hamill, Harrison Ford, Carrie Fisher'),
('Michel Gondry', 'Jim Carrey, Kate Winslet, Tom Wilkinson'), ('Stanley Kubrick', 'Keir Dullea, Gary Lockwood, William Sylvester'),
('Thomas Vinterberg', 'Mads Mikkelsen, Thomas Bo Larsen, Annika Wedderkopp'), ('Quentin Tarantino', 'Harvey Keitel, Tim Roth, Michael Madsen'),
('Akira Kurosawa', 'Takashi Shimura, Nobuo Kaneko, Shin.ichi Himori'), ('David Lean', 'Peter OToole, Alec Guinness, Anthony Quinn'),
('Orson Welles', 'Orson Welles, Joseph Cotten, Dorothy Comingore'), ('Fritz Lang', 'Peter Lorre, Ellen Widmann, Inge Landgut');



-- Displaying the table --
SELECT * FROM directors_and_stars;



-- Creating the second table --


CREATE TABLE gross_and_origin (
id INT IDENTITY (1,1) PRIMARY KEY,
country VARCHAR (30) DEFAULT 'USA',
budget REAL,
box_office REAL);



-- Inserting information into the second table --


/* the financial information was collected from wikipedia, The Numbers and the Movie Database websites */ 



INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (25, 73.3), (7.2, 291);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, UK', 185, 1006);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (13, 93), (0.337, 2), (22, 322.2);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, Germany, New Zealand', 100, 1470);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (8.5, 213.9);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, New Zealand', 93, 898.2), ('Italy', 1.2, 38.9);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (55, 678.2), (65, 101.2);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, New Zealand', 94, 947.9), ('USA, UK', 160, 839);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (30.5, 549);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, Australia', 63, 467.2);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (25, 47.1), (4.4, 163.3), (100, 689.8), (34, 327.3), (3.18, 3.3);


INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Japan', 0.580, 0.84);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (19, 272.7);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, UK', 165, 715);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (70, 482.3);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Brazil', 3.3, 30.6);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Italy', 15000, 230.1);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (60, 286.8), (11, 775.8), (102, 520.9), (19, 388.8);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Japan', 19.2, 395.8);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('France, Germany, Poland, UK', 35, 120.1);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (0.81, 50);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('South Korea', 15.5, 267.7);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, UK', 103, 503.2);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (45, 968.4);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('France', 16, 46.1);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (20, 23.9), (90, 291.5), (3.3, 49);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, UK', 40, 109.7), ('USA, UK', 100, 915.9);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, Germany', 6, 67), ('Japan', 3.7, 0.5), ('Japan', 0, 0.1);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (1, 6.9);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('France', 10.8, 426.6);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (1.5, 1.8);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Italy, France', 5, 36);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, Italy', 5, 40);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (1, 37);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, UK', 11, 184.7);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (1.5, 4.25), (31, 150), (9, 40.1), (100, 426), (20, 389.9), (180, 532.5);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Germany', 2, 77.3);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (1.75, 5), (0.9, 1.2), (400, 2052);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, UK', 19, 47.3);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (2.2, 5), (2, 9), (90, 384.3);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, UK', 18.5, 183.3), ('USA, UK', 300, 1082);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, Germany', 70, 321.5);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (15, 356.3);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, UK', 1.8, 9.2), ('South Korea', 3, 17.1);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (225, 814.3), (18, 90), (30, 394.4);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Germany', 84.9, 257);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (70, 213.2), (400, 2799), (70, 1074);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Japan', 23.5, 194.3);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (10, 225.9);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, Italy', 30, 5.5);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Japan', 5.065, 382.2);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('India', 6.629, 48.287);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Japan', 1.552, 3.106);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (2.54, 7.2), (4.5, 7.4);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Lebanon', 4, 68.6);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (200, 1067);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Russia', 2.5, 21);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (42.7, 482), (20, 74);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('USA, UK', 10.5, 146);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Denmark', 3.45, 18.3);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (3, 2.9);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Japan', 0, 0.552);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('UK', 15, 70);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (budget, box_office)
VALUES (0.840, 1.8);

INSERT INTO IMDbTop100_db.dbo.gross_and_origin (country, budget, box_office)
VALUES ('Germany', 0, 0.356);



-- Next is created a new column to store the movies ROI, only for those which budget information was available --


ALTER TABLE IMDbTop100_db.dbo.gross_and_origin
ADD gross_roi REAL;

UPDATE IMDbTop100_db.dbo.gross_and_origin
SET gross_roi = ((box_office-budget)/budget)*100 WHERE budget<>0 ;


-- Presenting the full information stored into the second table--


SELECT * FROM gross_and_origin;



-- The below query displays a table containing the information stored in both tables. This will be extracted to excel and saved to then be used in Power BI and Spyder --


SELECT country, director, stars, budget, box_office, gross_roi FROM directors_and_stars
FULL OUTER JOIN gross_and_origin 
on directors_and_stars.id = gross_and_origin.id;



/* END */