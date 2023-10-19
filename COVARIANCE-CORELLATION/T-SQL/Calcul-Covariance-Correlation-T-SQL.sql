SELECT * FROM [Statistics].[dbo].[CovarianceCorrelationNew]

-- STEP 1 - CALCULATE MEAN(X) & MEAN(Y)
SELECT AVG(X) as 'Mean(X)' FROM [dbo].[CovarianceCorrelationNew]
SELECT AVG(Y) as 'Mean(Y)' FROM [dbo].[CovarianceCorrelationNew]

-- STEP 2 - CALCULATE 
-- X - MEAN(X) 
-- Y - MEAN(Y)

;WITH MedTb AS (
	SELECT 
		AVG(X) as MeanX, 
		AVG(Y) as MeanY 
	FROM [dbo].[CovarianceCorrelationNew]
)
SELECT 
 CC.X, 
 CC.Y,
 MedTb.MeanX,
 MedTb.MeanY
FROM MedTb, [dbo].[CovarianceCorrelationNew] CC 

-- STEP 3 - CALCULATE DEVIATION X and Y
;WITH MedTb AS (
	SELECT 
		AVG(X) as MeanX, 
		AVG(Y) as MeanY 
	FROM [dbo].[CovarianceCorrelationNew]
),
CovCorr AS (
SELECT 
 CC.X, 
 CC.Y,
 MedTb.MeanX,
 MedTb.MeanY,
 CC.X - MedTb.MeanX as DevX,
 CC.Y - MedTb.MeanY as DevY,
 ( CC.X - MedTb.MeanX ) * ( CC.Y - MedTb.MeanY ) as DevXY,
 ( CC.X - MedTb.MeanX ) * ( CC.X - MedTb.MeanX ) as DevXX,
 ( CC.Y - MedTb.MeanY ) * ( CC.Y - MedTb.MeanY ) as DevYY
FROM MedTb, [dbo].[CovarianceCorrelationNew] CC 
)
SELECT 
	SUM(CovCorr.DevXY) as CCDevXY,
	SUM(CovCorr.DevXX) as CCDevXX,
	SUM(CovCorr.DevYY) as CCDevYY,
	COUNT(CovCorr.X) as N,
	(COUNT(CovCorr.X)-1) as 'N-1',
	(SUM(CovCorr.DevXX)/(COUNT(CovCorr.X)-1)) as VarianceX,
	(SUM(CovCorr.DevYY)/(COUNT(CovCorr.X)-1)) as VarianceY,
	(SUM(CovCorr.DevXY)/(COUNT(CovCorr.X)-1)) as CovarianceXY,
	(SUM(CovCorr.DevXY)/(COUNT(CovCorr.X)-1))/((SUM(CovCorr.DevXX)/(COUNT(CovCorr.X)-1)) ) * ( (SUM(CovCorr.DevYY)/(COUNT(CovCorr.X)-1)) ) as CorrelationXY
FROM CovCorr