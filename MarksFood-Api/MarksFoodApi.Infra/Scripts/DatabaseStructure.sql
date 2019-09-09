﻿CREATE DATABASE MarksFood
GO

USE MarksFood;
GO

CREATE TABLE Ingredient(
	[Id]	UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	[Name]	VARCHAR(30) NOT NULL,
	[Price] MONEY NOT NULL
)
GO

CREATE TABLE Snack(
	[Id] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50) NOT NULL
)
GO

CREATE TABLE SnackIngredients(
	IdSnack UNIQUEIDENTIFIER NOT NULL,
	IdIngredient UNIQUEIDENTIFIER NOT NULL,
	Quantity SMALLINT NOT NULL,
	FOREIGN KEY ([IdSnack]) REFERENCES [Snack]([Id]),
	FOREIGN KEY ([IdIngredient]) REFERENCES [Ingredient]([Id]),
)
GO

CREATE TABLE Discount(
	Id UNIQUEIDENTIFIER NOT NULL,
	Name VARCHAR(30) NOT NULL,
	IdIngredientAllowed UNIQUEIDENTIFIER NOT NULL,
	IdIngredientRestrict UNIQUEIDENTIFIER,
	DiscountType INT NOT NULL,
	Quantity INT,
	[Percent] DECIMAL(5,2) NOT NULL,
	FOREIGN KEY([IdIngredientAllowed]) REFERENCES [Ingredient]([Id]),
	FOREIGN KEY([IdIngredientRestrict]) REFERENCES [Ingredient]([Id])
)
GO