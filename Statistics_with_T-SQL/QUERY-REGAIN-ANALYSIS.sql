SELECT [ProjectName]
      ,[date]
      ,[EnrolledUsers]
      ,[CreatedUsers]
	  ,[CreatedUsers]-[DeactivatedUsers] as CurrentPopulation
      ,[ActiveUsers]	  
      ,[InactiveUsers]
      ,[EngagedUsers]
      ,[DisengagedUsers]
      ,[DeactivatedUsers]
  FROM [DWH].[ALLPROJECTS]
  WHERE ProjectName = 'Sanofi REGAIN BreatheSmart (US)'
   AND ( 
   Date = CONVERT(date, '2023-01-01') OR Date = CONVERT(date, '2023-01-15') OR Date = CONVERT(date, '2023-01-31') OR
   Date = CONVERT(date, '2023-02-01') OR Date = CONVERT(date, '2023-02-15') OR Date = CONVERT(date, '2023-02-28') OR
   Date = CONVERT(date, '2023-03-01') OR Date = CONVERT(date, '2023-03-15') OR Date = CONVERT(date, '2023-03-31') OR
   Date = CONVERT(date, '2023-04-01') OR Date = CONVERT(date, '2023-04-15') OR Date = CONVERT(date, '2023-04-30') OR
   Date = CONVERT(date, '2023-05-01') OR Date = CONVERT(date, '2023-05-15') OR Date = CONVERT(date, '2023-05-31') OR
   Date = CONVERT(date, '2023-06-01') OR Date = CONVERT(date, '2023-06-15') OR Date = CONVERT(date, '2023-06-30') OR
   Date = CONVERT(date, '2023-07-01') OR Date = CONVERT(date, '2023-07-15') OR Date = CONVERT(date, '2023-07-31') OR
   Date = CONVERT(date, '2023-08-01') OR Date = CONVERT(date, '2023-08-15') OR Date = CONVERT(date, '2023-08-31') OR
   Date = CONVERT(date, '2023-09-01') OR Date = CONVERT(date, '2023-09-15') OR Date = CONVERT(date, '2023-09-30') OR
   Date = CONVERT(date, '2023-10-01') OR Date = CONVERT(date, '2023-10-15') 
   )

 