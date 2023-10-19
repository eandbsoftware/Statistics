SELECT st.student stdid,
nt.note noteval
FROM dbo.Students st INNER JOIN Notes nt
ON st.id = nt.student_id

WITH StStatistics AS(
SELECT 
st.student stdid,
nt.note noteval
FROM dbo.Students st INNER JOIN Notes nt
ON st.id = nt.student_id
)
SELECT StStatistics.stdid, AVG(StStatistics.noteval) as Average, STDEV(StStatistics.noteval) as StandardDeviation
FROM StStatistics
GROUP BY StStatistics.stdid

-- repartition 
WITH StStatistics AS(
SELECT 
st.student stdid,
nt.note noteval
FROM dbo.Students st INNER JOIN Notes nt
ON st.id = nt.student_id
)
SELECT StStatistics.stdid, 
AVG(StStatistics.noteval) as Average, 
STDEV(StStatistics.noteval) as StandardDeviation,
AVG(StStatistics.noteval) - STDEV(StStatistics.noteval) as '1sigma - 68%[low]',
AVG(StStatistics.noteval) + STDEV(StStatistics.noteval) as '1sigma - 68%[hight]',
AVG(StStatistics.noteval) - 2*(STDEV(StStatistics.noteval)) as '2sigma - 95.4%[low]',
AVG(StStatistics.noteval) + 2*(STDEV(StStatistics.noteval)) as '2sigma - 95.4%[hight]',
AVG(StStatistics.noteval) - 3*(STDEV(StStatistics.noteval)) as '3sigma - 99.7%[low]',
AVG(StStatistics.noteval) + 3*(STDEV(StStatistics.noteval)) as '3sigma - 99.7%[hight]'
FROM StStatistics
GROUP BY StStatistics.stdid
