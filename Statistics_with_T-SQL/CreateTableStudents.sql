/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[student]
  FROM [Statistics].[dbo].[Students]

--  TRUNCATE TABLE Students

--INSERT INTO Students VALUES ('Student_1'), ('Student_2'), ('Student_3')