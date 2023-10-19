--INSERT INTO dbo.Series VALUES ('Serie_Quartile')

--INSERT INTO dbo.SeriesValues 
--VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16)


SELECT 
	sr.SerieName as serie,
	sv.SerieValue as val
FROM [dbo].[Series] sr
	INNER JOIN [dbo].[SeriesValues] sv
	ON sr.id = sv.SeriesId

    --Lower Quartile (Q1) = (N+1) / 4.
    --Middle Quartile (Q2) = (N+1) / 2.
    --Upper Quartile (Q3 )= (N+1) * 3 / 4.
    --Interquartile Range = Q3 – Q1.

WITH SerieQuartile AS (
	SELECT 
	sr.SerieName as serie,
	sv.SerieValue as val
	FROM [dbo].[Series] sr
	INNER JOIN [dbo].[SeriesValues] sv
	ON sr.id = sv.SeriesId
)
SELECT 
   (COUNT(SerieQuartile.val)+1)/4   as 'Quartile-1 (25%)',
   (COUNT(SerieQuartile.val)+1)/2   as 'Quartile-2 (50%)',
   (3*COUNT(SerieQuartile.val)+1)/4 as 'Quartile-3 (75%)',
   ((3*COUNT(SerieQuartile.val)+1)/4) - ((COUNT(SerieQuartile.val)+1)/4) as 'Interquartile Range'
FROM SerieQuartile
