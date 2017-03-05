/*
 James No
 Project #8: Create a DB for Al's Aquariums
 IT 125 B. Barry 
*/ 

DROP DATABASE IF EXISTS CookbookRecipes;

CREATE DATABASE IF NOT EXISTS CookbookRecipes;

USE CookbookRecipes;

/*
Parent Tables
*/

CREATE TABLE Cuisine
(
	CuisineId	   INT  AUTO_INCREMENT  PRIMARY KEY
,	Name		   VARCHAR(25)  NOT NULL
);

CREATE TABLE Ingredients
(
	IngredientsId  INT  AUTO_INCREMENT  PRIMARY KEY
,	Name		   VARCHAR(45)  NOT NULL
,	IngredientType VARCHAR(45)  NOT NULL
);
    
CREATE TABLE RecipeType
(
	RecipeTypeId  INT  AUTO_INCREMENT  PRIMARY KEY
,   Name		   VARCHAR(45)
);

CREATE TABLE Author
(
	AuthorId         INT  AUTO_INCREMENT  PRIMARY KEY
,	AuthorLastName   VARCHAR(45)  NOT NULL
,	AuthorFirstName  VARCHAR(45)  NOT NULL
);

CREATE TABLE Publisher
(
	PublisherId    INT  AUTO_INCREMENT  PRIMARY KEY
,	Name		   VARCHAR(45)  NOT NULL
);			

CREATE TABLE Cookbook
(
	CookbookId     INT  AUTO_INCREMENT  PRIMARY KEY
,	Name		   VARCHAR(45)  NOT NULL
,	PublishYear	   YEAR(4)
,	PublisherId	   INT NOT NULL
,	CONSTRAINT  fk_PublisherId_CookBook
		FOREIGN KEY (PublisherId)
			REFERENCES Publisher (PublisherId)
);

CREATE TABLE Recipes
(
	RecipesId    	INT AUTO_INCREMENT  PRIMARY KEY
,   Name        	VARCHAR(45)  NOT NULL					
,   Instructions   	VARCHAR(1000)								    
,   RecipeTypeId	INT NOT NULL
,	CookbookId		INT NOT NULL
,	CuisineId		INT NOT NULL
,	CONSTRAINT  fk_CookbookId_Recipes 
		FOREIGN KEY (CookbookId)
			REFERENCES Cookbook (CookbookId),
	CONSTRAINT  fk_CuisineId_Recipes
		FOREIGN KEY (CuisineId)
			REFERENCES Cuisine (CuisineId)
);

/*
Joining Tables
*/

CREATE TABLE CookbookAuthor
(
	CookbookId	   INT NOT NULL
,	AuthorId	   INT NOT NULL
,	CONSTRAINT
		PRIMARY KEY (CookbookId, AuthorId),
	CONSTRAINT  fk_CookbookId_CookbookAuthor
		FOREIGN KEY (CookbookId)
			REFERENCES Cookbook (CookbookId),
	CONSTRAINT  fk_AuthorId_CookbookAuthor
		FOREIGN KEY (AuthorId)
			REFERENCES Author (AuthorId)
);

CREATE TABLE RecipeIngredients
(
	RecipesId	   INT NOT NULL
,   IngredientsId  INT NOT NULL
,	IngredientAmount VARCHAR(45)
,   CONSTRAINT
		PRIMARY KEY (RecipesId, IngredientsId),
	CONSTRAINT  fk_RecipesId_RecipeIngredients
		FOREIGN KEY (RecipesId)
			REFERENCES Recipes     (RecipesId),
	CONSTRAINT  fk_IngredientsId_RecipeIngredients
		FOREIGN KEY (IngredientsId)
			REFERENCES Ingredients (IngredientsId)
);

CREATE TABLE PublisherAuthor
(
	PublisherId	   INT NOT NULL
,	AuthorId	   INT NOT NULL
,	CONSTRAINT
		PRIMARY KEY (PublisherId, AuthorId),
	CONSTRAINT  fk_PublisherId_PublisherAuthor
		FOREIGN KEY (PublisherId)
			REFERENCES Publisher (PublisherId),
	CONSTRAINT  fk_AuthorId_PublisherAuthor
		FOREIGN KEY (AuthorId)
			REFERENCES Author (AuthorId)
);

/*
RECIPE SECTION
*/

/*
Inserting RecipeType
*/
INSERT INTO RecipeType
	(Name)
VALUES
	('Breakfast'),				# 1
    ('Appetizer'),				# 2
    ('Salad'),					# 3
    ('Soup'),					# 4
    ('Stew'),					# 5
    ('Entree'),					# 6
    ('Pasta'),					# 7
    ('Fish'),					# 8
    ('Seafood'),				# 9
    ('Vegetarian'),				# 10
    ('Dessert');				# 11
    
/*
Inserting Ingredients
*/
INSERT INTO Ingredients
	(Name, IngredientType)
VALUES
	/*Vegetables*/
    ('Corn', 'Veg'),				# 1
    ('Potato', 'Veg'),				# 2
    ('Kombu', 'Veg'),				# 3
    ('Onion', 'Veg'),				# 4
    ('Garlic', 'Veg'),				# 5 
    ('Carrot', 'Veg'),				# 6
    ('Celery', 'Veg'),				# 7
    ('Tomato, Fresh', 'Veg'),		# 8
    ('Lettuce', 'Veg'),				# 9
    ('Fennel', 'Veg'),				# 10
    /*Fruits*/
    /*Herbs & Spices*/
    ('Salt', 'Spice'),					# 11
    ('Black Pepper', 'Spice'),			# 12
    ('Sugar', 'Spice'),					# 13
    ('Ex-Virgin Olive Oil', 'Spice'),	# 14
    ('Fennel Seed', 'Spice'),			# 15
    ('Dill', 'Herb'),					# 16
    ('Lemon Zest', 'Spice'),			# 17
    /*Meat & Poultry*/
    /*Dairy*/
    ('Butter', 'Dairy'),				# 18
    ('Yogurt, Greek', 'Dairy'),			# 19
    ('Goat Cheese', 'Dairy'),			# 20
    /*Water and Stock/*
    /*Sub-recipes*/
    ('Harissa', 'Sub-recipe');			# 21
    
/*
Inserting Cuisines
*/
INSERT INTO Cuisine
	(Name)
VALUES
	('French'), 			# Index 1
    ('Italian'), 			# Index	2
    ('British'), 			# Index 3
    ('Spanish'), 			# Index 4
    ('Portuguese'), 		# Index 5
    ('Greek'), 				# Index 6
    ('American'), 			# Index 7
    ('Chinese'), 			# Index 8
    ('Japanese'), 			# Index 9
    ('Korean'), 			# Index 10
    ('Vietnamese'), 		# Index 11
    ('Thai'), 				# Index 12
	('Indian'), 			# Index 13
    ('Pacific Northwest');	# Index 14
    
/*
COOKBOOK SECTION
*/
    
/*
Inserting Publishers
*/
INSERT INTO Publisher
	(Name)
VALUES
	('ReganBooks'), 		# Index 1
    ('Chronicle Books'),	# Index 2
    ('Morrow Books'),		# Index 3
    ('Sasquatch Books'),	# Index 4
    ('Potter'),				# Index 5
    ('Norton');				# Index 6
    
/*
Inserting Cookbooks
*/
INSERT INTO Cookbook
	(Name, PublishYear, PublisherId)
VALUES
	('The Modern Vegetarian Kitchen', 2000, 1),		# 1
    ('Plenty', 2010, 2),							# 2
    ('Tom Douglas''s Seattle Kitchen', 2001, 3),	# 3
    ('A Boat, A Whale, & A Walrus', 2014, 4),		# 4
    ('Koreatown: A Cookbook', 2016, 5),				# 5
    ('Mastering Sauces', 2015, 6);					# 6
    
/*
Inserting Authors
*/
INSERT INTO Author
	(AuthorLastName, AuthorFirstName)
VALUES
	('Berley', 'Peter'),		# 1
    ('Clark', 'Melissa'),		# 2
	('Ottolenghi', 'Yotam'),	# 3
	('Douglas', 'Tom'),			# 4
    ('Erickson', 'Renee'),		# 5
    ('Thomson', 'Jess'),		# 6
    ('Hong', 'Deuki'),			# 7
    ('Rodbard', 'Matt'),		# 8
    ('Volland', 'Susan');		# 9
    
/*
Organizing Publisher/Author Relationship
*/
INSERT INTO PublisherAuthor
	(AuthorId, PublisherId)
VALUES
	(1, 1),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 4),
    (6, 4),
    (7, 5),
    (8, 5),
    (9, 6);
    
/*
Organizing Author/Cookbook Relationship
*/
INSERT INTO CookbookAuthor
	(CookbookId, AuthorId)
VALUES
	(1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
	(4, 6),
    (5, 7),
    (5, 8),
    (6, 9);
    
    /*
Inserting Recipes
*/
INSERT INTO Recipes
	(Name, Instructions, CookbookId, CuisineId, RecipeTypeId)
VALUES
	('Summertime Corn and Vegetable Chowder',
     'Scrape corn kernels from cob, save cobs. Combine cobs, diced potatoes, kombu and water into medium saucepan,
     bringing to a boil. Remove kombu after boiling. Reduce heat to low and simmer for 20 mins, until potatoes 
     can be pierced with a fork. Remove and discard cobs.
     While broth simmers, warm butter and oil over medium heat. Add onion and salt and saute until onion is softened.
     Stir in corn kernels, garlic, carrot, celery, and tomatoes. Reduce heat to low, cover, and cook for 15 minutes,
     stirring until vegetables are tender.
     Puree potatoes in its water, using either an immersion blender or a standing blender, then add vegetables to puree.
     Stir in lettuce and basil.
     Season with salt and pepper, and serve.',
     1,
     14,
     4),
	('Caramelized Fennel With Goat Cheese',
     'Remove fennel fronds, keeping for garnish. Trim fennel root and remove tough outer layers. Slice in half lengthwise.
     Melt butter with olive oil over medium high heat. When melted, cover the pan with a layer of sliced fennel. Leave fennel
     to sear for 2 minutes, then turn the slices over, cooking for another 2-3 minutes. Remove and repeat searing process
     for the rest of fennel.
     After all fennel has been seared, add sugar, fennel seeds, and salt & pepper to pan. Fry for 30 seconds, then return fennel
     slices to pan and caramelize gently for 1-2 minutes. Remove from pan and allow to cool in a mixing bowl.
     Toss fennel with garlic and dill. Plate, and dot spoonfuls of cheese on top of the fennel. Add a drizzle of oil and 
     lemon zest. Garnish with fennel fronds.
     Serve at room temperature.',
     4,
     3,
     8),
	('Etta''s Pit-Roasted Salmon',
     'Make the spice rub. Combine brown sugar, smoked paprika, salt, pepper, and thyme in bowl. Coat both sides
     of salmon with a drizzle of olive oil, then coat with spice rub. Broil in oven for 10-12 mins, until salmon
     is medium-firm. Serve.',
     3,
     14,
     8),
	('Triple Coconut Cream Pie',
	 'Make pastry cream. Combine milk and coconut in saucepan. Scrape vanilla bean and add both seeds and pod to the milk 
     mixture. Bring the heat to medium and heat until almost boiling.
     In a bowl, whisk eggs, sugar, and flour until well combined. Temper the eggs with the warm milk mixture to prevent
     eggs from curdling. Add the rest of the egg mixture to the milk until the mixture is very thick, about 4-5 mins. Remove 
     pan from heat and add butter. Discard vanilla pod. Place pastry cream in a bowl and cool bowl in an ice bath. Stir
     occasionally until cooled down. The pastry cream will thicken as it cools.
     When pastry cream is cooled, fill pre-baked pie shell with cream, smoothing the surface. Add whipped cream, and serve.',
     3,
     14,
     11),
     ('Soy and Sesame Spinach',
     'Bring large pot of water to boil over high heat. Fill a bowl with ice water and set nearby. Salt the water in the pot generously, 
     then blanch spinach in water for 30 seconds. Drain spinach and shock it in the ice-water bath. Drain again and squeeze spinach to get rid
     of excess water.
     In a small bowl, stir soy sauce, sesame oil, sugar, pepper, and garlic. Add spinach and toss thoroughly. Garnish with sesame seeds.',
     5,
     10,
     10);
     
     
     
/*
Inserts ingredient quantities into joining table
*/
     
INSERT INTO RecipeIngredients
	(RecipesId, IngredientsId, IngredientAmount)
VALUES
	(1, 1, '3 cobs'),
    (1, 2, '2 cups peeled & diced, or 1/2 lb'),
    (1, 3, '3-inch piece'),
    (1, 4, '1 onion, diced'),
    (1, 5, '2 cloves, minced'),
    (1, 6, '1, quartered and sliced'),
    (1, 7, '1 rib, thinly sliced'),
    (1, 8, '1 lb, peeled & chopped'),
    (1, 9, 'Cut into ribbons');
    
/*
VIEWS
*/
    
/*
View for all recipes with their associated cookbooks
*/
CREATE OR REPLACE VIEW recipes_cookbooks AS    
	SELECT r.Name AS 'Recipe Name'
    , 	   c.Name AS 'Cookbook Title'
	FROM Recipes r
		JOIN Cookbook c
			USING (CookbookId);
            
/*
View for all recipes with their associated cuisine and recipe types
*/
CREATE OR REPLACE VIEW recipes_description AS    
	SELECT r.Name  AS 'Recipe Name'
    , 	   c.Name  AS  Cuisine
    , 	   rt.Name AS 'Recipe Type'
	FROM Recipes r
		JOIN Cuisine c
			USING (CuisineId)
		JOIN RecipeType rt
			USING (RecipeTypeId);
            
/*
QUERIES
*/
            
/*
List all cookbooks with their authors, publishers, & year published
Newest cookbooks first, then by author last name
*/
SELECT c.Name 											 AS 'Cookbook Title'
,	   c.PublishYear									 AS 'Year Published'
, 	   CONCAT(a.AuthorLastName, ', ', a.AuthorFirstName) AS Author
,	   p.Name											 AS Publisher
FROM Cookbook c
		JOIN CookbookAuthor
			USING (CookbookId)
		JOIN Author a
			USING (AuthorId)
		JOIN Publisher p
			USING (PublisherId)
ORDER BY c.PublishYear DESC,
		 Author;


/*
Find a recipe and its cookbook that contains potatoes & onions
*/
SELECT r.Name			AS Recipe
,      c.Name			AS 'Cookbook Title'
, 	   r.Instructions
FROM Recipes r
	JOIN Cookbook c
		USING (CookbookId)
	JOIN RecipeIngredients ri
		USING (RecipesId)
	JOIN Ingredients i
		USING (IngredientsId)
WHERE i.Name = 'potato';

/*
Find a Pacific Northwest recipe
*/
SELECT DISTINCT r.Name 			AS Recipe
, 				r.Instructions
, 				cu.Name 		AS Cuisine
FROM Recipes r
	JOIN Cuisine cu
		USING (CuisineId)
	JOIN RecipeIngredients ri
		USING (RecipesId)
	JOIN Ingredients i
		USING (IngredientsId)
WHERE cu.Name = 'Pacific Northwest';

    
/*
Knowing RecipeId, Find ingredient list and quantities
*/
SELECT r.Name				AS Recipe
, 	   i.Name				AS Ingredient
, 	   ri.IngredientAmount  AS 'Ingredient Amount'
FROM Recipes r 
	JOIN RecipeIngredients ri
		USING (RecipesId)
	JOIN Ingredients i
		USING (IngredientsId)
WHERE RecipesId = 1;