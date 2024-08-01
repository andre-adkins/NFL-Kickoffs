CREATE TABLE NFLdata.kickoff_data_by_yearkickoff_data_by_year AS
(SELECT kickoff_data.Year, ROUND(avg(kickoff_data.Avg), 2) AS Avg_Yds_Per_Return, ROUND(avg(kickoff_data.Yds), 2) AS Avg_KRet_Yds_Per_Season, sum(kickoff_data.KRet_TD) AS Total_KRet_TD, sum(kickoff_data.`20_yd_returns`) AS Total_20_Yd_Returns, sum(kickoff_data.`40_yd_returns`)AS Total_40_Yd_Returns, sum(kickoff_data.`Fair Catch`) AS Total_Fair_Catches, sum(kickoff_data.Touchbacks) AS Total_Touchbacks, ROUND(avg(kickoff_data.Ret_Allowed), 0) AS Avg_Ret_Allowed
FROM NFLdata.kickoff_data
GROUP BY Year)