/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[student_id]
      ,[note]
  FROM [Statistics].[dbo].[Notes]
  -- TRUNCATE TABLE Notes
 -- Student 1
 -- INSERT INTO Notes VALUES (1,12),(1,12),(1,12),(1,12),(1,12),(1,12)

 -- Student 2
 -- INSERT INTO Notes VALUES (2,10),(2,11),(2,11),(2,13),(2,13),(2,14)

  -- Student 3
 -- INSERT INTO Notes VALUES (3,4),(3,4),(3,4),(3,20),(3,20),(3,20)
